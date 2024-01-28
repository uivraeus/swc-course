"""
A test suite for the Greeter class
"""

import pytest

from greeting import Greeter

def test_default():
    "Test with default phrase"
    greeter = Greeter()

    response = greeter.hello("Junior", 24)
    assert "Hello Junior. You're young and very promising!" == response

def test_override():
    "Test with phrase override"
    greeter = Greeter("Yo!")

    response = greeter.hello("Ulf", 47)
    assert "Yo! Ulf. You're on fire!" == response

def test_invalid():
    "Test negative age"
    greeter = Greeter()

    response = greeter.hello("Negative", -1)
    assert "Hello Negative. What a strange age!" == response
