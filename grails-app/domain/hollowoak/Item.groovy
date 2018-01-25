package hollowoak

class Item {

    String name
    String description
    int price
    boolean forSale
    String category

    static mapping = {
       description sqlType: 'text'
    }

    static constraints = {
    }
}
