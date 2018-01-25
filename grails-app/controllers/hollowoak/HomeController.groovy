package hollowoak

class HomeController {

    // Items

    def index() { 
        def items = Item.findAllByForSale(true)
        def pics = Pic.findAllByPriority(1)
        [items: items, pics: pics]
    }

    def view() {
        def items = Item.findAllByForSale(true)
        def itemIds = items.collect { it.id }
        def item = Item.findById(params.id)
        def index = itemIds.findIndexOf { "${it}" == params.id }
        def pics = Pic.findAllByItemId(params.id)
        [item: item, pics: pics, itemIds: itemIds, index: index]
    }

    def categories() {
        def cats = Category.findAll()
        [categories: cats]
    }

    def category() {
        def cat = Category.findByName(params.title)
        def items
        if (params.for_sale == 'true') {
            items = Item.findAllByForSaleAndCategory(true, cat.id)
        } 
        else {
            items = Item.findAllByCategory(cat.id)
        }
        def pics = Pic.findAllByPriority(1)
        [items: items, pics: pics, category: cat, for_sale: params.for_sale]
    }

    // Cart

    def cart() {
        def items = Item.findAllByIdInList(session.items?.keySet())
        def totalPrice = getTotalPrice()
        [items: items, total: totalPrice]
    }

    def addToCart() {
        if (session.items) {
            if (session.items.containsKey(params.id)) {
                session.items[params.id] += 1
            }
            else {
                session.items[params.id] = 1
            }
        }
        else {
            session.items = [(params.id):1]
        }
        flash.message = "Item added to cart"
        redirect(action: 'view', params: [id: params.id])
    }

    def plusOne() {
        session.items[params.id] += 1
        redirect(action: 'cart')
    }

    def minusOne() {
        session.items[params.id] -= 1
        if (session.items[params.id] <= 0) {
            session.items.remove(params.id)
        } 
        redirect(action: 'cart')
    }

    def getTotalPrice() {
        def total = 0
        session.items.each { id, amount ->
            total += Item.findById(id).price * amount
        }
        return total
    }
}
