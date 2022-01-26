import unittest
from increase_calculator import *

class TestIncreaseCounter(unittest.TestCase):

	def test_first(self):

		calculator = IncreaseCalculator()

		calculator.increase_counter(1,2)

		self.assertEqual(calculator.increase_count,1)

	def test_second(self):

		calculator = IncreaseCalculator()

		calculator.increase_counter(2,1)

		self.assertEqual(calculator.increase_count,0)

class TestExecute(unittest.TestCase):

	def test_first(self):

		calculator = IncreaseCalculator()

		calculator.execute([1,2])

		self.assertEqual(calculator.increase_count,1)

	def test_second(self):

		calculator = IncreaseCalculator()

		calculator.execute([1,2,3,2,1])

		self.assertEqual(calculator.increase_count,2)