# Test with [pytest](https://docs.pytest.org)

Start test with:

```shell
pytest
```

Or, if you have [pytest-watch](https://pypi.org/project/pytest-watch) installed:

```shell
ptw
```

## Requirements

Create a simple String calculator with the following method, modified for the current language:

* int Add(string numbers)

The method can take two numbers, separated by commas, and shall return their sum. 

* Example: “” or “1” or “1,2” as inputs.
* “” shall return 0

The method shall handle any amount of input numbers.

The method shall also handle new lines between numbers (instead of commas).

* Example: “1\n2,3” and shall return 6

The method shall support user defined delimiters

* Either by adding a separate argument to the Add or by making it a part of the input string

The method shall support negative numbers.

Numbers bigger than 99999999 cannot be handled

* If an input is larger than this an error message shall be returned containing the erroneous input
* If the sum is larger than this an error message shall be return stating that the sum was too big

The method shall be able to handle delimiters of arbitrary length > 0

* Return appropriate error messages for erroneous delimiters

The delimiter cannot be a character that could be a part of a number
