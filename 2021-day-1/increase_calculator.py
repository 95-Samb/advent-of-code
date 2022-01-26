class IncreaseCalculator:

	def __init__(self):
		self.increase_count = 0

	def increase_counter(self,first,second):
		if second > first: self.increase_count += 1 
			