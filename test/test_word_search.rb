require './lib/word_search.rb'
require 'minitest/autorun'

class WordSearchTest < Minitest::Test
  include WordSearch

  def test_initializing_grid
    Grid.new([
      %w( A B C D E ),
      %w( F G H I J ),
      %w( K L M N O ),
      %w( P Q R S T ),
      %w( U V W X Y )
    ])
  end

  def test_indexing_grid_by_column_and_row
    grid = Grid.new([
      %w( A B C D E ),
      %w( F G H I J ),
      %w( K L M N O ),
      %w( P Q R S T ),
      %w( U V W X Y )
    ])
    assert_equal('U', grid.letter_at(0, 4))
  end
end
