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

    def newItem() {}

    
















    private static final def USER = 'ShayFibbernacci'
    private static final def PASS = '~Cgy753712'
}
