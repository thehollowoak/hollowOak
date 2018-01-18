package hollowoak

class AdminController {

    def login() { }

    def varify() {
        if (params.username == USER && params.password == PASS) {
            session.admin = true
            redirect(controller: 'home', action: 'index')
        }
        else {
            redirect(action: 'login')
        }
    }

    def logout() {
        session.removeValue('admin')
        redirect(controller: 'home', action: 'index')
    }

    def newItem() {
        if (!session.admin) {
            redirect(controller: 'home', action: 'index')
        }
     }

    def create() {
        new Item(params).save()
        redirect(controller: 'home', action: 'index')
    }

    def deleteItem() {
        Item.get(params.id).delete(flush: true)
        redirect(controller: 'home', action: 'index')
    }

    def editItem() {
        def item = Item.get(params.id)
        render(view: 'editItem', model: [item: item])
    }

    def update() {
        def item = Item.get(params.id)
        item.properties = params
        item.save(flush: true)
        redirect(controller: 'home', action: 'view', id: item.id)
    }    
















    private static final def USER = 'ShayFibbernacci'
    private static final def PASS = '~Cgy753712'
}
