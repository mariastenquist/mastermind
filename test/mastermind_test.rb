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

	def test_the_main_menu
		# skip
		mastermind = Mastermind.new
		expected = nil
		assert_equal "p", mastermind.main_menu
	end

	def test_the_game_will_exit
		mastermind = Mastermind.new
		expected = "Goodbye, you are leaving the game!!"
		assert_equal expected, mastermind.exit_game
	end
end