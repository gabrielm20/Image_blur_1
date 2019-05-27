class Image

  def initialize(matrix)
    @my_matrix = matrix
    @row_length = matrix.length
    @col_length = matrix[0].length
  end
  
  def output_image()
    @my_matrix.each do |row|
      row.each do |points|
        print(points, " ")
      end # end looping over col
      puts()      
    end # end looping over row
  end

  def blur(row_index, col_index, matrix)
    matrix[row_index -1][col_index] = 1 unless row_index == 0
    matrix[row_index +1][col_index] = 1 unless row_index >= @row_length-1
    matrix[row_index][col_index +1] = 1 unless col_index >= @col_length-1
    matrix[row_index][col_index -1] = 1 unless col_index == 0
  end

  def search()
    ones = []

    @my_matrix.each_with_index do |rows, row_index|
        rows.each_with_index do |point, col_index|
        if point == 1
          ones << [row_index, col_index]
        end
      end
    end
    return ones
  end

  def apply_blur()
    one_coords = search()
    blurred_matrix = Marshal.load(Marshal.dump(@my_matrix))

    one_coords.each do |x, y|
      blur(x, y, blurred_matrix)
    end

    return Image.new(blurred_matrix)
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image()
puts "///////"

# applying blur
blurred_image = image.apply_blur()

puts "original image"
image.output_image()

puts "blurred image"
blurred_image.output_image()
