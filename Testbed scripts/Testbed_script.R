# convert .jpg to bitmap for image filter function
# provide pathname to image of choice, provde cutoff grayscale value, provide colors (either rgb values or standard colors as string with eg. "pink")



filter_gray_scale_vectorized_anyimagetype <- function(your_image) {

  if (is.character(your_image) && file.exists(your_image)) {
    # Try to read the file as an image
    img <- tryCatch({
      image_read(your_image)
    }, error = function(e) {
      stop("The provided path is not a valid image file.")
    })
  } else if (inherits(your_image, "magick-image")) {
    # Input is already an image object
    img <- your_image
  } else {
    stop("Input must be a valid image file or a magick image object.")
  }

  # Convert the image to a bitmap
  bitmap <- image_data(img)

  #return(bitmap)
 #bitmap <- image_data(image_read(your_image)) #read your file file from your chosen filepath (preferably in project directory)

  # Calculate grayscale values for all pixels
  grayscale <- round(
    0.299 * as.numeric(bitmap[1, , ]) +
      0.587 * as.numeric(bitmap[2, , ]) +
      0.114 * as.numeric(bitmap[3, , ])
  )
  #print(grayscale)
  filtered_bitmap <- bitmap

  # Replicate the grayscale matrix into each channel
  filtered_bitmap[1, , ] <- as.raw(grayscale)  # R channel
  filtered_bitmap[2, , ] <- as.raw(grayscale)  # G channel
  filtered_bitmap[3, , ] <- as.raw(grayscale)  # B channel

  return(filtered_bitmap)
}

your_image <- "~/Rprogrammingversioncontrol/VectorizedColorFilter/Sourcefiles/test.jpg"
original<- image_read("~/Rprogrammingversioncontrol/VectorizedColorFilter/Sourcefiles/test.jpg")
print(original)

filter_gray_scale_vectorized_anyimagetype("~/Rprogrammingversioncontrol/VectorizedColorFilter/Sourcefiles/test.jpg")

filtered <- image_read(filter_gray_scale_vectorized_anyimagetype(("~/Rprogrammingversioncontrol/VectorizedColorFilter/Sourcefiles/test.jpg")))
print(filtered)
