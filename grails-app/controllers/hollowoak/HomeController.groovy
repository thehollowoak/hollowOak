package hollowoak

class HomeController {

    def index() { 
        def item = Item.first()
        render(view: 'index', model: [item: item])
    }
}
