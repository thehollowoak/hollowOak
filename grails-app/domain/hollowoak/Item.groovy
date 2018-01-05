package hollowoak

class Item {

    String name
    String img
    String description

    static mapping = {
       description sqlType: 'text'
    }

    static constraints = {
    }
}
