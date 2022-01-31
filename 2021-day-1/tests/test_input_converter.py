import unittest
from input_converter import *

class TestInputConverter(unittest.TestCase):

	def test_first(self):

		input = "1\n2"

		self.assertEqual(InputConverter.execute(input),[1,2])