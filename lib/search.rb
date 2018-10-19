require './lib/coordinates.rb'

module WordSearch
  class Search
    include Coordinates

    def initialize(words, grid)
      @words = words
      @grid = grid
    end

    def word_at_position_in_direction?(word, column, row, direction)
      coordinates = coordinate_list(column, row, direction, word.length)
      checks = coordinates.zip(word.split(''))
      checks.all? do |coordinate, letter|
        @grid.letter_match_at?(letter, coordinate[0], coordinate[1])
      end
    end

    def word_matches_coordinate_list?(word, coordinates)
      checks = coordinates.zip(word.split(''))
      checks.all? do |coordinate, letter|
        @grid.letter_match_at?(letter, coordinate[0], coordinate[1])
      end
    end
  end
end
