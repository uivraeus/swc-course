# -*- coding: utf-8 -*-

class Greeter(object):
    "A simple example"

    def __init__(self, phrase = "Hello"):
        self.phrase = phrase

    def hello(self, name, age):
        "The main API"
        age_verdict = "?"
        if age > 50:
            age_verdict = "You are very wise!"
        elif age > 30:
            age_verdict = "You're on fire!"
        elif age > 0:
            age_verdict = "You're young and very promising!"
        else:
            age_verdict = "What a strange age!"

        result = f"{self.phrase} {name}. {age_verdict}"

        return result
