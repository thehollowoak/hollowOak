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
        def item = new Item(name: params.name, price: params.price, description: params.description).save()
        def imgs = params.img.split(', ')
        imgs.eachWithIndex { img, i ->
            new Pic(file: img, itemId: item.id, priority: i+1).save()
        }
        redirect(controller: 'home', action: 'index')
    }

    def deleteItem() {
        Item.get(params.id).delete(flush: true)
        def pics = Pic.findAllByItemId(params.id)
        pics.each {
            it.delete(flush: true)
        }
        redirect(controller: 'home', action: 'index')
    }

    def editItem() {
        if (!session.admin) {
            redirect(controller: 'home', action: 'index')
        }
        def item = Item.get(params.id)
        def pics = Pic.findAllByItemId(params.id)
        def string = ''
        pics.each { pic ->
            string += "${pic.file}, "
        }
        render(view: 'editItem', model: [item: item, pics: string[0..-3]])
    }

    def update() {
        def item = Item.get(params.id)
        item.properties = [name: params.name, price: params.price, description: params.description]
        item.save(flush: true)
        updatePics(params.imgs, params.id)
        
        redirect(controller: 'home', action: 'view', id: item.id)
    }    

    private def updatePics(imgString, itemId) {
        def imgs = imgString.split(', ')
        def pics = Pic.findAllByItemId(itemId)
        if (imgs.size() > pics.size()) {
            pics.size().upto(imgs.size()-1) {
                pics += new Pic()
            }
        }
        imgs.eachWithIndex { img, i ->
            def pic = pics[i]
            pic.properties = [file: img, itemId: itemId, priority: i+1]
            pic.save(flush: true)
        }
        if (imgs.size() < pics.size()) {
            imgs.size().upto(pics.size()-1) {
                pics[it].delete(flush: true)
            }
        }
        
    }














    private static final def USER = 'ShayFibbernacci'
    private static final def PASS = '~Cgy753712'
}
