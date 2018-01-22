package hollowoak

class ProjectController {

    def index() {
        def items = Item.findAllByForSale(false)
        def pics = Pic.findAllByPriority(1)
        render(view: 'index', model: [items: items, pics: pics])
    }

    def about() { }

    def view() {
        def item = Item.findById(params.id)
        def pics = Pic.findAllByItemId(params.id)
        render(view: 'view', model: [item: item, pics: pics])
    }
}
