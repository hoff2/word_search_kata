module WordSearch
  class Grid
    def initialize(rows)
      @grid = rows
    end

    def letter_at(column, row)
      @grid[row][column]
    end
  end

  HORIZONTAL = [1, 0]
  VERTICAL = [0, 1]

  def coordinate_list(start_column, start_row, direction, length)
    if length == 0
      []
    else
      [[start_column, start_row]] +
        coordinate_list(
        start_column + direction[0],
        start_row + direction[1],
        direction,
        length - 1)
    end
  end
end
