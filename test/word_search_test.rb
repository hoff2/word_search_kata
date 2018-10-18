require './lib/word_search.rb'
require 'minitest/autorun'

class WordSearchTest < Minitest::Test
  include WordSearch
  def test_truth
    assert(true)
  end
end
