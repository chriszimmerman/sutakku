require './die.rb'

class Game

	attr_reader :dice_left
	attr_reader :stack
	attr_reader :score
	attr_reader :playing

	def initialize
		@dice_left = []
		10.times do
			@dice_left.unshift(Die.new)	
		end

		@stack = []
		@score = 0
		@playing = false
	end

	def loop
		@playing = true
	
		puts "Game start!"

		while @playing do
			puts "What do you want to do? Valid commands: roll, look, stop"
			input = gets.chomp

			if input == "stop" then
				stop_game
			elsif input == "roll" then
				if @dice_left.length == 0 then
					@playing = false
					@score = calculate_score + 100
					puts "STAKKU! You earn 100 bonus points!"
				else
					roll_dice = []
					3.times do
						if @dice_left.length > 0 then
							roll_dice.push(@dice_left.pop)
						end
					end	
					
					puts "Here are your rolls:"
					roll_dice.each do |die|
						die.roll
						puts die.roll					
					end


				end
			elsif input == "look" then
				puts "Here is your stack:"
				if @stack.length == 0 then
					puts "Empty Stack\n"
				end

				@stack.each do |die|
					puts die.number
				end
			else
				puts "I don't recognize the command \"#{input}.\""
			end
		end

		puts "Your total is #{@score}! Thanks for playing!"
	end

	def stop_game
		@playing = false
	end

	def calculate_score
		@stack.length * @stack[0]
	end

	def take_dice dice
		
	end
end
