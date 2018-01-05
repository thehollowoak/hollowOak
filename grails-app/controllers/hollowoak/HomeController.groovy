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
}
