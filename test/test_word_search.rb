require './lib/word_search.rb'
require 'minitest/autorun'

class WordSearchTest < Minitest::Test
  include WordSearch

  def setup
    @grid = Grid.new([
      %w( A B C D E ),
      %w( F G H I J ),
      %w( K L M N O ),
      %w( P Q R S T ),
      %w( U V W X Y )
    ])
  end

  def test_indexing_grid_by_column_and_row
    assert_equal('U', @grid.letter_at(0, 4))
  end

  # in order to search a place in the grid for a word
  # i want to generate a list of coordinates to
  # compare to letters in the word
  def test_generate_horizontal_list_of_coordinates
    assert_equal(
      [[0, 4], [1, 4], [2, 4], [3, 4]],
      coordinate_list(0, 4, HORIZONTAL, 4))
  end
end
