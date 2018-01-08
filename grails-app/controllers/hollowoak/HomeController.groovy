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
        def items = Item.findAllByIdInList(session.items.keySet())
        render(view: 'cart', model: [items: items])
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
}
