class IncreaseCalculator:

	def __init__(self,number_list):
		self.increase_count = 0
		self.number_list = number_list

	def execute(self):
		i = 0
		while i + 1 < len(self.number_list):
			self.increase_counter(self.number_list[i],self.number_list[i + 1])
			i += 1

		return self.increase_count

	def increase_counter(self,first,second):
		if second > first: self.increase_count += 1 
			