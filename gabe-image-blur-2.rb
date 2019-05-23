# big_array = [
#   [2, 25, 123, 1000],
#   [1, 3,    5,        7]
# ]

# print big_array[0][1] # Row, Column (RC cola)
# puts


# Goal: define a class (called Image) that prints an array when we call output_image
class Image

  def initialize(matrix)
    @my_matrix = matrix
    @row_length = matrix.length
    @col_length = matrix[0].length
  end
  
  def output_image()
    @my_matrix.each do |row|
      row.each do |points|
        print points, " "
      end # end looping over col
      puts      
    end # end looping over row
  end


  def blur(row_index, col_index)
    @my_matrix[row_index -1][col_index] = 1 unless row_index == 0
    @my_matrix[row_index +1][col_index] = 1 unless row_index >= @row_length-1
    @my_matrix[row_index][col_index +1] = 1 unless col_index >= @col_length-1
    @my_matrix[row_index][col_index -1] = 1 unless col_index == 0
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
    ones
  end

  def apply_blur()
    one_coords = search

    one_coords.each do |x, y|
      blur(x, y)
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
puts "///////"
image.apply_blur
image.output_image


#### end of blur #1 #####


### start of blur 2 ####
# image.transform()
## image.output_image()




