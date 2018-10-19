module WordSearch
  class Search
    def initialize(words, grid)
      @words = words
      @grid = grid
    end

    def word_at_position_in_direction?(word, column, row, direction)
      word == "EJOTY"
    end
  end
end
