
#'
#' Vectorized Grayscale Filter

#' @description
#' Converts any image of common format (eg .jpg .png. etc.) or pathname to your image file
#' Applies grayscale filter according to 0.299 x R,  0.587 x G,  and 0.114 x B
#' uses the magick package and outputs image file using image_read function.
#' @param your_image Any image object loaded into R of common type or pathname to your image
#' @return A filtered image with grayscale values applied. (using image_read from library(magick))
#' @examples

#' # Load example image from the package
#' test_image_path <- system.file("extdata", "test.jpg", package = "VectorizedColorFilter")
#' grayscale_image <- filter_grayscale(test_image_path)
#' grayscale_image
#' # Apply filter to an image object
#' img <- magick::image_read(test_image_path)
#' grayscale_image <- filter_grayscale(img)
#' print(grayscale_image)

#' @importFrom magick image_read image_data
#' @export
filter_grayscale<- function(your_image) {

  if (is.character(your_image) && file.exists(your_image)) {

    img <- tryCatch({                # Try to read the file as an image
      magick::image_read(your_image)
    }, error = function(e) {
      stop("The provided path is not a valid image file.") #error with message
    })                                                       # Input is already an image object
  } else if (inherits(your_image, "magick-image")) {        # tries to read as an image and brings its class
    img <- your_image
  } else {
    stop("Input must be a valid image file or a magick image object.")  # if not image or filepath
  }


  bitmap <- magick::image_data(img) # Convert the image to a bitmap

  # Calculate grayscale in numeric RGB values for all pixels
  grayscale <- round(
    0.299 * as.numeric(bitmap[1, , ]) +
      0.587 * as.numeric(bitmap[2, , ]) +
      0.114 * as.numeric(bitmap[3, , ])
  )

  filtered_bitmap <- bitmap #prepares output bitmap (necessary?)

  # Replicate the grayscale matrix into each channel
  filtered_bitmap[1, , ] <- as.raw(grayscale)  # R channel
  filtered_bitmap[2, , ] <- as.raw(grayscale)  # G channel
  filtered_bitmap[3, , ] <- as.raw(grayscale)  # B channel

  filtered_image <- magick::image_read(filtered_bitmap)
  #print(as.raw(color_2))
  return(filtered_image)
}

