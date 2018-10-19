require './lib/grid.rb'
require 'minitest/autorun'

class TestGrid < Minitest::Test
  include WordSearch

  def setup
    @grid = Grid.new(
      [
        %w[A B C D E],
        %w[F G H I J],
        %w[K L M N O],
        %w[P Q R S T],
        %w[U V W X Y]
      ]
    )
  end

  def test_indexing_grid_by_column_and_row
    assert_equal('U', @grid.letter_at(0, 4))
  end

  def test_can_check_for_a_letter_match
    assert(@grid.letter_match_at?('U', 0, 4))
    refute(@grid.letter_match_at?('U', 0, 0))
  end

  def test_letter_match_check_returns_false_if_coordinates_invalid
    refute(@grid.letter_match_at?('U', 0, 5))
    refute(@grid.letter_match_at?('A', -1, -1))
  end

  def test_can_return_size
    assert_equal(5, @grid.row_count)
    assert_equal(5, @grid.column_count)
  end
end
