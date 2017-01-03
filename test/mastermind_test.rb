require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/mastermind"

class MastermindTest < Minitest::Test

	def test_that_class_exists
		mastermind = Mastermind.new
		assert_instance_of Mastermind, mastermind
	end

	def test_messages
		mastermind = Mastermind.new  
		assert nil, mastermind.messages
	end

	def test_it_displays_intro
   		mastermind = Mastermind.new 
   		assert_output("Welcome to MASTERMIND"){mastermind.messages}
 	end

 	def test_it_displays_enter_game
 		mastermind = Mastermind.new
 		assert_output("I have generated a beginner sequence with four elements made up of: (r)ed,
			(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
			What's your guess?"){mastermind.enter_game}
 	end

	def test_the_game_will_exit
		mastermind = Mastermind.new
		expected = "Goodbye, you are leaving the game!!"
		assert_equal expected, mastermind.exit_game
	end
end