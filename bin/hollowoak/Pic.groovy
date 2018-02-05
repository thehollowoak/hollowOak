package hollowoak

class Pic {

    String file
    Long itemId
    int priority

    static mapping = {
        sort "priority"
    }

    static constraints = {
    }
}
