# frozen_string_literal: true

def list_files_in_columns(columns = 3)
  current_path = Dir.pwd # Get the current working directory

  folder_glob = "#{current_path}/*"

  # Use Dir.glob to get the list of files matching the pattern
  files = Dir.glob(folder_glob)

  # Calculate the maximum filename length
  max_length = files.map { |file| File.basename(file).length }.max || 0

  # Calculate the width of each column
  column_width = (max_length + 2)

  # Calculate the number of rows
  (files.length.to_f / columns).ceil

  # Initialize an empty array to store the columns
  column_arrays = Array.new(columns) { [] }

  # Distribute the files into columns
  files.each_with_index do |file, index|
    column_arrays[index % columns] << File.basename(file)
  end

  # Display the files in columns
  column_arrays.each do |row|
    columns.times do |col|
      print row[col]&.ljust(column_width)
      # file_index = row + col * rows
      # print column_arrays[col][file_index].to_s.ljust(column_width)
    end
    puts
  end
end

# Call the function to list files in columns
list_files_in_columns
