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

  def test_can_check_coordinate_list_for_word
    assert(@search.word_matches_coordinate_list?(
      "EJOTY", [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4]]
    ))
    assert(@search.word_matches_coordinate_list?(
      "PQRS", [[0, 3], [1, 3], [2, 3], [3, 3]]
    ))
    refute(@search.word_matches_coordinate_list?(
      "WORD", [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4]]
    ))
  end




end
