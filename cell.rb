class Cell
	def initialize(index)
		@index = index
		@value = index
	end

	def to_s
		return "#{value}"
	end
	attr_accessor:index
	attr_accessor:value
end