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
        def companion_description = 'Take this friendly cube with you wherever you go! ' +
            'It will hold your stuff while protecting you from turrets. Made with duct tape ' +
            'and covered with clear tape to prevent wear. The bag is about 10"x10"x2".'
        def majora_description = "It's Majora's Mask from Legond of Zelda. It's so cool."

        def tardis = new Item(name: "Tardis Bag", price: 18, description: tardis_description, forSale: true).save()
        def bmo = new Item(name: "BMO Bag", price: 18, description: bmo_description, forSale: true).save()
        def trainer = new Item(name: "Pokemon Trainer Bag", price: 22, description: trainer_description, forSale: true).save()
        def cube = new Item(name: "Companion Cube Bag", price: 18, description: companion_description, forSale: true).save()
        def mask = new Item(name: "Majora's Mask Bag", price: 22, description: majora_description, forSale: true).save()

        new Pic(file: "tardis_small.jpg", itemId: tardis.id, priority: 2).save()
        new Pic(file: "tardis_full.jpg", itemId: tardis.id, priority: 1).save()
        new Pic(file: "majoras_mask.jpg", itemId: mask.id, priority: 1).save()
        new Pic(file: "bmo.jpg", itemId: bmo.id, priority: 1).save()
        new Pic(file: "trainer.jpg", itemId: trainer.id, priority: 1).save()
        new Pic(file: "companion_cube.jpg", itemId: cube.id, priority: 1).save()

    }
    def destroy = {
    }
}
