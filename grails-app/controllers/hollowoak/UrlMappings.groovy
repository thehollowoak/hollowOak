package hollowoak

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/" {
            controller = 'home'
            action = 'index'
        }
        "/login" {
            controller = 'admin'
            action = 'login'
        }

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
