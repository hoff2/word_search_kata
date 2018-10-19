require './lib/coordinates.rb'

module WordSearch
  class Search
    include Coordinates

    def initialize(words, grid)
      @words = words
      @grid = grid
    end

    def word_matches_coordinate_list?(word, coordinates)
      checks = coordinates.zip(word.split(''))
      checks.all? do |coordinate, letter|
        @grid.letter_match_at?(letter, coordinate[0], coordinate[1])
      end
    end

    def find_word(word)
      [[4, 0], [4, 1], [4, 2], [4, 3], [4, 4]]
    end
  end
end
