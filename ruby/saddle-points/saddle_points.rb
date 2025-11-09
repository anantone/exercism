class Grid
  def self.saddle_points(input)
    solution = []
    columns = input.transpose 
      input.each_with_index do|row, row_idx|
        row.each_with_index do |column, column_idx|
          if columns[column_idx].min == row.max
             solution << {"row" => row_idx + 1, "column" => column_idx + 1}
          end
        end
      end
    solution
  end
end