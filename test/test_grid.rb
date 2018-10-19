require './lib/grid.rb'
require 'minitest/autorun'

class TestGrid < Minitest::Test
  include WordSearch

  def setup
    @grid = Grid.new([
      %w(A B C D E),
      %w(F G H I J),
      %w(K L M N O),
      %w(P Q R S T),
      %w(U V W X Y)
    ])
  end

  def test_indexing_grid_by_column_and_row
    assert_equal('U', @grid.letter_at(0, 4))
  end

  def test_can_check_for_a_letter_match
    assert(@grid.letter_match_at?('U', 0, 4))
    refute(@grid.letter_match_at?('U', 0, 0))
  end
end
