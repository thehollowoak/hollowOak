package hollowoak

class Item {

    String name
    String description
    int price

    static mapping = {
       description sqlType: 'text'
    }

    static constraints = {
    }
}
