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
        def forSale = params.forSale? true : false
        def category = Category.findByName(params.category)
        if (!category) {
            category = new Category(name: params.category, meta: params.meta).save(flush: true)
        }
        def item = new Item(name: params.name, price: params.price, description: params.description, 
            forSale: forSale, category: category.id).save(flush: true)
        def imgs = params.imgs.split(', ')
        imgs.eachWithIndex { img, i ->
            new Pic(file: img, itemId: item.id, priority: i+1).save(flush: true)
        }
        redirect(controller: forSale? 'home' : 'project', action: 'index')
    }

    def deleteItem() {
        def item = Item.get(params.id)
        Item[] items = Item.findAllByCategory(item.category)
        if (items.size()<=1) {
            def category = Category.get(item.category)
            category.delete(flush: true)
        }
        def forSale = item.forSale
        item.delete(flush: true)
        def pics = Pic.findAllByItemId(params.id)
        pics.each {
            it.delete(flush: true)
        }
        redirect(controller: forSale? 'home' : 'project', action: 'index')
    }

    def editItem() {
        if (!session.admin) {
            redirect(controller: 'home', action: 'index')
        }
        def item = Item.get(params.id)
        def category = Category.get(item.category)
        def pics = Pic.findAllByItemId(params.id)
        def string = ''
        pics.each { pic ->
            string += "${pic.file}, "
        }
        [item: item, pics: string[0..-3], category: category]
    }

    def update() {
        def item = Item.get(params.id)
        def category = Category.findByNameAndMeta(params.category, params.meta)
        if (!category) {
            category = new Category(name: params.category, meta: params.meta).save(flush: true)
        }
        item.properties = [name: params.name, price: params.price, description: params.description, 
            category: category.id]
        item.save(flush: true)
        updatePics(params.imgs, params.id)
        
        redirect(controller: item.forSale? 'home' : 'project', action: 'view', id: item.id)
    }

     def activateItem() {
        def item = Item.get(params.id)
        item.properties = [forSale: !item.forSale]
        item.save(flush: true)
        redirect(controller: 'home', action: 'index')
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
