package hollowoak

class HomeController {

    def index() { 
        def item = Item.first()
        render(view: 'index', model: [item: item])
    }

    def view() {
        def item = Item.findById(params.id)
        render(view: 'view', model: [item: item])
    }
}
