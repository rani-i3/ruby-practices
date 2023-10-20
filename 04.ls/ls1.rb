# frozen_string_literal: true

def list_files
  current_path = Dir.pwd
  folder_glob = "#{current_path}/*"
  files = Dir.glob(folder_glob)
  files.map { |file| File.basename(file) }
end

def print_files_in_columns(columns = 3)
  file_list = list_files
  max_length = file_list.map { |file| file.length }.max || 0
  column_width = (max_length + 2)
  rows = (file_list.length.to_f / columns).ceil
  column_arrays = Array.new(rows){[]}

  file_list.each_with_index do |file, index|
    column_arrays[index % rows] << file
  end

  column_arrays.each do |row|
    row.each do |col|
      print col&.ljust(column_width)
    end
    puts
  end
end

print_files_in_columns
