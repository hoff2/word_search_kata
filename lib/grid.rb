module WordSearch
  class Grid
    def initialize(rows)
      @grid = rows
    end

    def letter_at(column, row)
      @grid[row][column]
    end
  end
end
