package hollowoak

class Item {

    String name
    String description
    int price
    boolean forSale

    static mapping = {
       description sqlType: 'text'
    }

    static constraints = {
    }
}
