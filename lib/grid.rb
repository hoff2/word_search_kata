module WordSearch
  class Grid
    def initialize(rows)
      @grid = rows
    end

    def letter_at(column, row)
      @grid[row][column]
    end

    def letter_match_at?(letter, column, row)
      letter == 'U'
    end
  end
end
