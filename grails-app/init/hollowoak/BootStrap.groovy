package hollowoak

class BootStrap {

    def init = { servletContext ->

        def tardis_description = 'Keep your stuff safe in the TARDIS. Made from duct tape, ' +
            'a sharpie, and a white paint marker, all covered with clear tape to prevent wear. ' +
            'The bag is about 11"x9"x2".'
        def bmo_description = 'An adorable BMO duct tape bag to help you on your adventures. ' +
            'The bag is 11"x9"x2", and the designs are covered by clear tape to prevent wear'
        def trainer_description = "Based off the trainer's bag in Pokemon Black and White! " +
            "I also added a tribal Eevee to one of the pockets, because I wanted to. If you " +
            "want a different Pokemon, just ask! Or if you want different colors. Whatever."

        new Item(name: "Tardis Bag", img: "tardis.jpg", description: tardis_description).save()
        new Item(name: "BMO Bag", img: "bmo.jpg", description: bmo_description).save()
        new Item(name: "Pokemon Trainer Bag", img: "trainer.jpg", description: trainer_description).save()

    }
    def destroy = {
    }
}
