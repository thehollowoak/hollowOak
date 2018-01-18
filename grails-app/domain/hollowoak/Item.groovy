package hollowoak

class Item {

    String name
    String img, img1, img2, img3, img4, img5
    String description
    int price

    static mapping = {
       description sqlType: 'text'
    }

    static constraints = {
    }
}
