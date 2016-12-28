require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test 
	
  def setup
    @sequence ||= Sequence_Generator.create
  end

  def test_class_exists
    assert @sequence
  end

  def test_sequence_is_an_array
    assert_equal false, @sequence.empty?
  end

  def test_sequence_has_four_elements
    assert_equal 4, @sequence.length
  end

  def test_it_includes_b_g_r_y
    assert true, @sequence.include?('b')
    assert true, @sequence.include?('g')
    assert true, @sequence.include?('r')
    assert true, @sequence.include?('y')
  end
end