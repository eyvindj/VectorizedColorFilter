
#' Vectorized Grayscale Filter using
#' Converts any image of common format (eg .jpg .png. etc.) or pathname to your image file
#' Applies 0.299 * R,  0.587 * G,  and 0.114 * B
#'
#'
#' @param your_image Any image object loaded into R of common type or pathname to your image
#' @return A filtered bitmap with grayscale values applied.
#' @export
filter_gray_scale_vectorized <- function(your_image) {

  if (is.character(your_image) && file.exists(your_image)) {

    img <- tryCatch({                # Try to read the file as an image
      image_read(your_image)
    }, error = function(e) {
      stop("The provided path is not a valid image file.") #error with message
    })                                                       # Input is already an image object
  } else if (inherits(your_image, "magick-image")) {        # tries to read as an image and brings its class
    img <- your_image
  } else {
    stop("Input must be a valid image file or a magick image object.")  # if not image or filepath
  }


  bitmap <- image_data(img) # Convert the image to a bitmap

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

  filtered_image <- image_read(filtered_bitmap)
  #print(as.raw(color_2))
  return(filtered_image)
}

