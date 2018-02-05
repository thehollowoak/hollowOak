package hollowoak

class ProjectController {

    def index() {
        def items = Item.findAllByForSale(false)
        def pics = Pic.findAllByPriority(1)
        render(view: '../home/index', model: [items: items, pics: pics])
    }

    def about() { }

    def view() {
        def items = Item.findAllByForSale(false)
        def itemIds = items.collect { it.id }
        def item = Item.findById(params.id)
        def index = itemIds.findIndexOf { "${it}" == params.id }
        def pics = Pic.findAllByItemId(params.id)
        [item: item, pics: pics, itemIds: itemIds, index: index]
    }
}
