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
        def items = session.items
        render(view: 'cart', model: [items: items])
    }

    def addToCart() {
        if (session.items) {
            session.items += Item.findById(params.id)
        }
        else {
            session.items = [Item.findById(params.id)]
        }
        flash.message = "Item added to cart"
        redirect(action: 'view', params: [id: params.id])
    }
}
