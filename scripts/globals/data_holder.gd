extends Node

var scripted_encounters = {
    "first_message": {
        "text": "You walk down the streets of Shibuya with relative uncertainty. Things have been strange"
            + "for the last few days. "
            + "For better or worse, you suppose. Though that's never stopped you from doing stupid "
            + "things.\n"
            + "\n"
            + "Glancing to your right, you see that same, strange entity that's been following you for "
            + "a few days now. It doesn't look remotely humnanoid, and it's terrifying. What the hell "
            + "is this supposed to be? You don't know, and honestly, you're getting tired of this not "
            + "knowing.\n"
            + "\n"
            + "So, with all your bravery, you've decided to approach it. Maybe it's just your brain playing "
            + "tricks on you. It always liked doing that.\n",
        "delay": true,
        "speed": 1,
        "id": 0,
        "choices": {
            "Be Aggressive": {
                "text": "You don't reckon this big ugly thing is here to chat with you about your car's extended warranty.\n"
                    + "\n"
                    + "If it's gonna keep following you everywhere you go, it's going to catch these hands.\n",
                "id": 1,
                "delay": true
            },
            "Be Diplomatic": {
                "text": "You wouldn't want to stir up trouble with something that looks like it'd eat you for lunch.\n"
                    + "\n"
                    + "You're going to talk with it and see what's going on, that sounds like the safest option to you.\n",
                "id": 2,
                "delay": true
            }
        }
    },

    "aggressive_intro_consequence": {
        "text": "You raise your fists as you approach it. It makes a sound so repulsing you start second-guessing yourself. "
            + "This might not be as good of an idea as you thought. But alas, you've already made your decision.\n"
            + "\n"
            + "Without hesitation, you rush into a full-blown sprint towards this entity, and it doesn't make a "
            + "single movement. It stood still, like a statue. Before you could react, it blasted you away into a "
            + "building behind.\n"
            + "\n"
            + "That hurt. Probably wasn't the best idea to fight something you don't know, but who are you to "
            + "judge? Well, looks like it's time for round two because this thing is moving extremely quickly "
            + "towards you.\n",
        "delay": true,
        "id": 3,
    },

    "passive_intro_consequence": {
        "text": "You confidently stride towards this entity, hands in your pockets. You're halfway through the road "
            + "when you notice it's not moving. It's so eerily still that you feel it's some sort of statue. Alas, "
            + "it might be too late to back down now.\n"
            + "\n"
            + "You stare at the singular eye protruding out of its potato-like shape, almost bedazzled at what "
            + "you're witnessing. You feel completely hopeless in talking with this being; after all, what said "
            + "it even spoke at all? That's just going to add to your struggles.\n"
            + "\n"
            + "Before you could react, a gust of winds sends you flying back into a building behind you. That "
            + "hurt. Looks like it doesn't share your enthusiasm for conversation, especially because it's darting "
            + "towards you. Well, looks like it's time for round two.\n",
        "delay": true,
        "id": 4,
    }
}
