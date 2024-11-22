
#'  Prepared code to run the included test image
#' @param your_image Any image object loaded into R of common type or pathname to your image
#' @return An image  with grayscale values applied or twolor filter on top of that.

#run code to import test image to object
testimage <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg"
image_read(testimage )

# run code to test and display gray and twocolor separately
filter_grayscale("~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg")
filter_grayscale(testimage)
filter_twocolor(testimage)
