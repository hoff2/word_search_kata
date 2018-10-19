require 'minitest/autorun'
require './lib/search.rb'

class TestSearch < MiniTest::Test
  include WordSearch

  def setup
    grid = Grid.new([
      %w(A B C D E),
      %w(F G H I J),
      %w(K L M N O),
      %w(P Q R S T),
      %w(U V W X Y)
    ])
    @search = Search.new(%w(EJOTY), grid)
  end

  def test_can_tell_if_word_is_at_position_in_direction
    assert(@search.word_at_position_in_direction?(
      "EJOTY", 4, 0, Coordinates::VERTICAL))
    assert(@search.word_at_position_in_direction?(
      "PQRS", 0, 3, Coordinates::HORIZONTAL))
  end

  def test_can_tell_if_word_is_not_at_position_in_direction
    refute(@search.word_at_position_in_direction?(
      "WORD", 4, 0, Coordinates::VERTICAL))
  end
end
