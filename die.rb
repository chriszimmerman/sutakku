class Die
	include Comparable
	attr_accessor :number
		
	def initialize
		roll
	end

	def <=>(otherDie)
		number <=> otherDie.number
	end

	def roll
		@number = (Random.rand * 6 + 1).to_i
	end
end
