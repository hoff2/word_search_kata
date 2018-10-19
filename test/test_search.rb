require 'minitest/autorun'
require './lib/search.rb'

class TestSearch < MiniTest::Test
  include WordSearch

  def test_set_up_a_word_search
    @grid = Grid.new([
      %w(A B C D E),
      %w(F G H I J),
      %w(K L M N O),
      %w(P Q R S T),
      %w(U V W X Y)
    ])
    Search.new(%w(ejoty), @grid)
  end
end
