
#'  #Prepared code to run the included test image
#'
#'
#'

#run code to import test image to object
image_read("~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test2.jpg")
testimage <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg"
image_read(testimage )

testimage <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test2.jpg"
image_read(testimage )
# run code to test and display gray and twocolor separately
filter_grayscale("~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg")
filter_grayscale(testimage)
filter_twocolor("~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg")
filter_twocolor(testimage)

