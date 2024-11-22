
#'  #Prepared code to run the included test image

#run code to import test image to object

# run code to test and display gray and twocolor separately
image_read("~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg")
filter_grayscale("~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg")
filter_twocolor("~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg",
                color1="yellow", color2="purple")


testimage <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test2.jpg"
image_read(testimage )
filter_grayscale(testimage)
filter_twocolor(testimage, color1="yellow", color2="lightblue")

