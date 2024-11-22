
#'  Prepared code to run the included test image
#' @param your_image Any image object loaded into R of common type or pathname to your image
#' @return A filtered bitmap with grayscale values applied.

#run code for gray scale
filtered <- image_read(filter_gray_scale_vectorized("~/Rprogrammingversioncontrol/VectorizedColorFilter/Sourcefiles/test.jpg"))
print(filtered)

#run code to import test image to object
testimage <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/Sourcefiles/test.jpg"
image_read(testimage )

#run code to test twocolor filter
two_color_image <- image_read(filter_two_color_vectorized(testimage, cutoff =79,"pink","blue"))
two_color_image

# run code to test and display gray and twocolor separately
filter_gray_scale_vectorized(testimage)
filter_two_color_vectorized(testimage)
