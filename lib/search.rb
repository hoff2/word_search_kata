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

    def all_directions
      [ Coordinates::HORIZONTAL,
        Coordinates::VERTICAL,
        Coordinates::ASCENDING,
        Coordinates::REVERSE_HORIZONTAL,
        Coordinates::REVERSE_VERTICAL,
        Coordinates::REVERSE_ASCENDING,
        Coordinates::REVERSE_DESCENDING ]
    end

    def find_word(word)
      (0 ... @grid.column_count).each do |column|
        (0 ... @grid.row_count).each do |row|
          all_directions.each do |direction|
            coordinates = coordinate_list(column, row, word.length, direction)
            if word_matches_coordinate_list?(coordinates)
              return coordinates
            end
          end
        end
      end
      nil
    end
  end
end
