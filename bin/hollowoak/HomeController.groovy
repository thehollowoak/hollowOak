package hollowoak

class HomeController {

    def index() { 
        def items = Item.findAll()
        render(view: 'index', model: [items: items])
    }

    def view() {
        def item = Item.findById(params.id)
        render(view: 'view', model: [item: item])
    }

    def cart() {
        def items = Item.findAllByIdInList(session.items?.keySet())
        def totalPrice = getTotalPrice()
        render(view: 'cart', model: [items: items, total: totalPrice])
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
