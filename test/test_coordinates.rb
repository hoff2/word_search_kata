require './lib/coordinates.rb'
require 'minitest/autorun'

class CoordinatesTest < Minitest::Test
  include WordSearch::Coordinates

  # in order to search a place in the grid for a word
  # i want to generate a list of coordinates to
  # compare to letters in the word
  def test_generate_horizontal_list_of_coordinates
    assert_equal(
      [[0, 4], [1, 4], [2, 4], [3, 4]],
      coordinate_list(0, 4, HORIZONTAL, 4)
    )
  end

  def test_generate_vertical_list_of_coordinates
    assert_equal(
      [[4, 1], [4, 2], [4, 3], [4, 4]],
      coordinate_list(4, 1, VERTICAL, 4)
    )
  end

  def test_generate_descending_horizontal_list_of_coordinates
    assert_equal(
      [[0, 0], [1, 1], [2, 2]],
      coordinate_list(0, 0, DESCENDING, 3)
    )
  end

  def test_generate_ascending_horizontal_list_of_coordinates
    assert_equal(
      [[0, 4], [1, 3], [2, 2], [3, 1]],
      coordinate_list(0, 4, ASCENDING, 4)
    )
  end
end
