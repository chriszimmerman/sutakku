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
		@bust = false
	end

	def loop
		@playing = true	
		puts "Game start!"

		while @playing do
			puts "What do you want to do? Valid commands: roll, look, stop"
			input = gets.chomp

			case input
			when "stop"
				stop_game
			when "roll"
				if @dice_left.length == 0 then
					@playing = false
					puts "STAKKU! You earn 100 bonus points!\n"
				else
					roll_dice
				end
			when "look"
				puts "Here is your stack:"
				if @stack.length == 0 then
					puts "Empty Stack\n"
				else
					@stack.each do |die|
						puts die.number
					end

					puts "The top of your stack is #{@stack[0].number}"
				end			
			else
				puts "I don't recognize the command \"#{input}.\""
			end

		end

		puts "Your total is #{calculate_score}!" if !bust
		puts "Thanks for playing!"
	end

	def stop_game
		@playing = false
	end

	def calculate_score
		bonus = @dice_left.length > 0 ? 100 : 0
		@stack.length * @stack[0].number + bonus
	end

	def top_of_stack
		if @stack.length == 0 then
			0
		else
			@stack[0].number
		end
	end

	def bust
		@bust = true
	end

	def roll_dice
		dice = []
		3.times do
			if @dice_left.length > 0 then
				dice.push(@dice_left.pop)
			end
		end	
					
		puts "Here are your rolls:\n\n"
		dice.each do |die|
			die.roll
			puts die.roll					
		end
		puts "\n"

		sorted_dice = dice.sort
	
		valid_dice = sorted_dice.find_all{|die| die.number >= top_of_stack}.take(2)
		if valid_dice.length  == 0 then
			puts "BUST!"
			bust
			stop_game
		else
			valid_dice.each{|valid_die|
				@stack.unshift(valid_die)
				sorted_dice.delete(valid_die)
			}

			sorted_dice.each{|die_left|
				@dice_left.push(die_left)
			}
		end
	end
end
