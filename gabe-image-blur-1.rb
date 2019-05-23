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
  end
  
  def output_image()
    @my_matrix.each do | row | # TODO: loop over indices...
      row.each do | col |
        print col
        # TODO: @my_matrix[row][col]
      end # end looping over col
      puts      
    end # end looping over row
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image()


#### end of blur #1 #####


### start of blur 2 ####
# image.transform()
## image.output_image()




