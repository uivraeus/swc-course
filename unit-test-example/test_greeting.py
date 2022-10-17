"""
A test suite for the Greeter class
"""

import pytest

from greeting import Greeter


def test_ulf():
    "Test with phrase override"
    greeter = Greeter("Yo!")

    response = greeter.hello("Ulf", 46)
    assert "Yo! Ulf. You're on fire!" == response

def test_junior():
    "Test with default phrase"
    greeter = Greeter()

    response = greeter.hello("Junior", 24)
    assert "Hello Junior. You're young and very promising!" == response

if __name__ == '__main__':
    pytest.main()
