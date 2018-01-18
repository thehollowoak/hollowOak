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

        new Item(name: "Tardis Bag", img: "tardis.jpg", img1: "tardis.jpg", img2: "bmo.jpg", img3: "tardis.jpg", img4: "trainer.jpg", img5: "tardis.jpg", price: 18, description: tardis_description).save()
        new Item(name: "BMO Bag", img: "bmo.jpg", img1: "bmo.jpg", img2: "bmo.jpg", img3: "bmo.jpg", img4: "bmo.jpg", img5: "bmo.jpg", price: 18, description: bmo_description).save()
        new Item(name: "Pokemon Trainer Bag", img: "trainer.jpg", img1: "trainer.jpg", img2: "trainer.jpg", img3: "trainer.jpg", img4: "trainer.jpg", img5: "trainer.jpg", price: 22, description: trainer_description).save()

    }
    def destroy = {
    }
}
