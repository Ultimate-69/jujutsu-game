extends Node

# EACH CHOICE MUST HAVE AN ID
var scripted_encounters = {
    "first_message": {
        "text": """
You walk down the streets of Shibuya with relative uncertainty. Things have been strange
for the last few days.

For better or worse, you suppose. Though that's never stopped you from doing stupid 
things.

Glancing to your right, you see that same, strange entity that's been following you for 
a few days now. It doesn't look remotely humnanoid, and it's terrifying. What the hell
is this supposed to be? You don't know, and honestly, you're getting tired of this not 
knowing.

So, with all your bravery, you've decided to approach it. Maybe it's just your brain playing
tricks on you. It always liked doing that.
        """,
        "delay": 0,
        "speed": 1,
        "choices": {
            "Be Aggressive": {
                "text": """
You don't reckon this big ugly thing is here to chat with you about your car's extended warranty.

If it's gonna keep following you everywhere you go, it's going to catch these hands.
                """,
                "id": 0
            },
            "Be Diplomatic": {
                "text": """
You wouldn't want to stir up trouble with something that looks like it'd eat you for lunch.

You're going to talk with it and see what's going on with it, that sounds like the safest option
to you.
                """,
                "id": 1
            }
        }
    }
}
