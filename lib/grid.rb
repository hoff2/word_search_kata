module WordSearch
  class Grid
    def initialize(rows)
      @grid = rows
    end

    def row_count
      @grid.count
    end

    def column_count
      # making the assumption that all rows provided
      # are the same length
      @grid[0].count
    end

    def letter_at(column, row)
      @grid[row][column]
    end

    def letter_match_at?(letter, column, row)
      if (0 ... column_count).cover?(column) &&
          (0 ... row_count).cover?(row)
        letter_at(column, row) == letter
      else
        false
      end
    end
  end
end
