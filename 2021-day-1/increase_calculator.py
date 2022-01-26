class IncreaseCalculator:

	def __init__(self):
		self.increase_count = 0

	def execute(self,number_list):
		i = 0
		while i + 1 < len(number_list):
			self.increase_counter(number_list[i],number_list[i + 1])
			i += 1

	def increase_counter(self,first,second):
		if second > first: self.increase_count += 1 
			