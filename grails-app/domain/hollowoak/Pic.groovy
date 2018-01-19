package hollowoak

class Pic {

    String file
    Long itemId
    Integer priority

    static mapping = {
        sort "priority"
    }

    static constraints = {
    }
}
