package hollowoak

class BootStrap {

    def init = { servletContext ->

        new Item(name: "Tardis Bag", img: "tardis.jpg").save()

    }
    def destroy = {
    }
}
