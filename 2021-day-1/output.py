from input_converter import *
from increase_calculator import *

with open("input.txt") as f:
	input = f.read()

converted_input = InputConverter.execute(input)

answer = IncreaseCalculator().execute(converted_input)

print(answer)