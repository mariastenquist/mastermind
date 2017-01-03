require "pry"
require "./lib/sequence_generator"
class Mastermind
	include Sequence_Generator
	attr_reader :start, :end, :secret_code, :user_input
	def initialize
		@num_guesses = 0
		@game_start = Time.now
		@game_end = 0
		@secret_code = Sequence_Generator.create
	end
	def messages
		puts "Welcome to MASTERMIND"
		puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
	end

	def main_menu
		user_input = gets.chomp.downcase
		if 
			user_input == "p" || user_input == "play"
			enter_game
		elsif 
			user_input == "i" || user_input == "instructions"
			instructions
		elsif 
			user_input == "q" || user_input == "quit"
			exit_game
		else
			puts "please enter p, i, q, as your response is invalid"
			main_menu
		end
	end	
	
	def game_end
    	Time.now
  	end

  	def time_elapsed
    	game_end.to_i.round - @game_start.to_i.round
  	end

	def instructions
		puts "These are the instructions for Mastermind, There are four (base) colors in the beginner sequence: (r)ed, (g)reen, (b)lue, and (y)ellow. 
			The goal is to guess the secret code by matching the order of colors, and you win the game! 
			Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
		sleep(2)
		main_menu
	end

	def enter_game
		puts "I have generated a beginner sequence with four elements made up of: (r)ed,
			(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
			What's your guess?"
		@game_start
		user_input = gets.chomp.downcase
		validate_input(user_input)
	end

	def exit_game
		abort("Goodbye, you are leaving the game!!")
	end

	def validate_input(user_input)
		@num_guesses += 1
		
		if user_input == "q" || user_input == "quit"
			sleep(2)
			exit_game
		elsif user_input == "c" || user_input == "cheat"
			sleep(2)
			print_secret_code
		elsif user_input.length < 4
			puts "your guess is too short"
			sleep(2)
			enter_game
		elsif user_input.length > 4
			puts "your guess is too long, please enter the correct number of colors"
			sleep(2)
			enter_game
		elsif user_input == secret_code
			sleep(2)
			end_game
		elsif user_input != secret_code
			compare_guesses(user_input)
		end
	end

  	def compare_guesses(user_input)
  		matches = (user_input.chars & secret_code).count
  		correct_positions = 0
  		user_input.chars.each.with_index do |letter, index|
  			if secret_code[index] == letter
  				correct_positions += 1
  			end
  		end
  		puts "You have #{matches} correct elements with #{correct_positions} correct positions"
  		enter_game 
  	end
  	
	def print_secret_code
		puts "the secret code is #{secret_code}, shame on you for cheating!"
		
		enter_game
	end

	def end_game
		puts "You guessed the correct sequence: #{secret_code}, in #{@num_guesses} guesses, and it took you #{time_elapsed} seconds total! You won!"
		play_or_quit
	end

	def play_or_quit
		puts "Would you like to (p)lay again or (q)uit?"
		main_menu
	end	

end

mastermind = Mastermind.new
mastermind.messages
mastermind.main_menu
