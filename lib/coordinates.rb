module WordSearch
  module Coordinates
    HORIZONTAL = [1, 0].freeze
    VERTICAL = [0, 1].freeze
    DESCENDING = [1, 1].freeze
    ASCENDING = [1, -1].freeze
    REVERSE_HORIZONTAL = [-1, 0].freeze
    REVERSE_VERTICAL = [0, -1].freeze
    REVERSE_DESCENDING = [-1, -1].freeze
    REVERSE_ASCENDING = [-1, 1].freeze

    def coordinate_list(start_column, start_row, direction, length)
      if length.zero?
        []
      else
        [[start_column, start_row]] +
          coordinate_list(
            start_column + direction[0],
            start_row + direction[1],
            direction,
            length - 1
          )
      end
    end

    def display_coordinate_list(list)
      list.map do |coordinate|
        "(#{coordinate[0]},#{coordinate[1]})"
      end.join(',')
    end
  end
end
