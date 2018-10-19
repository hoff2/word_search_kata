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
      [
        HORIZONTAL,
        VERTICAL,
        ASCENDING,
        REVERSE_HORIZONTAL,
        REVERSE_VERTICAL,
        REVERSE_ASCENDING,
        REVERSE_DESCENDING
      ]
    end

    def find_word(word)
      (0...@grid.column_count).each do |column|
        (0...@grid.row_count).each do |row|
          all_directions.each do |direction|
            coordinates = coordinate_list(column, row, direction, word.length)
            if word_matches_coordinate_list?(word, coordinates)
              return coordinates
            end
          end
        end
      end
      nil
    end

    def word_locations_report
      @words.map do |word|
        result = find_word(word)
        result_str = if result.nil?
                       ''
                     else
                       display_coordinate_list(result)
                     end
        "#{word}: #{result_str}".strip
      end.join("\n")
    end
  end
end
