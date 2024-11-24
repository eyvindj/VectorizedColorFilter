
#'  #Prepared code to run the included test image

#run code to import test image to object
# run code to test and display gray and twocolor separately

library(magick)

testimage <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test.jpg"
testimage2 <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/SourceFiles/test2.jpg"
testimage<- magick::image_read(testimage)
testimage2<- magick::image_read(testimage2)

gray1 <- filter_grayscale(testimage)
gray2 <- filter_grayscale(testimage2)

twocolor1 <- filter_twocolor(testimage, color1="yellow", color2="lightblue")
twocolor2 <- filter_twocolor(testimage2, color1="yellow", color2="lightblue")

