#' Vectorized Two-Color Filter
#' @description
#' Converts any image of common format (eg .jpg .png. etc.) or pathname to your image file
#' Applies grayscale filter according to 0.299 x R,  0.587 x G,  and 0.114 x B
#'
#' Then applies a cutoff to the numerical gray scale value (0-255) and two colors to the upper and lower range
#' uses the magick package and outputs image file using image_read function.
#' @param your_image An image as either a file path or image of standard format (.jpg .png etc.).
#' @param color1  A  rgb triplet vector to select color 1 in twocolor image filter, R standard colors within "" (eg. "pink" )also works
#' @param color2  A rgb triplet vector to select color 2 in twocolor image filter, R standard colors within "" also works
#' @param cutoff  the default works well with supplied picture A numeric decimal value for the grayscale cutoff to apply two color filter.
#' @return A filtered bitmap with color_1 and color_2 values applied.
#' @examples
#' library(magick)
#' # Example using an image file
#' twocolor_image <- filter_twocolor("path/to/image.jpg")
#' # Example using an image object
#' img <- image_read("path/to/image.jpg")
#' twocolor_image <- filter_twocolor(img)
#'
#' @export

filter_twocolor <- function(your_image, cutoff = 97, color1="pink",color2="blue") {

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


  bitmap <- magick::image_data(img) #read your file file from your chosen filepath (preferably in project directory)

  color_1 <- c(col2rgb(color1))
  color_2 <- c(col2rgb(color2))
  #print(color_1)
  #print(color_2)
  # Convert to grayscale
  grayscale <- round(
    0.299 * as.numeric(bitmap[1, , ]) +
      0.587 * as.numeric(bitmap[2, , ]) +
      0.114 * as.numeric(bitmap[3, , ])
  )

  # Create an empty filtered bitmap
  filtered_bitmap <- bitmap

  # Apply the cutoff condition
  above_cutoff <- grayscale > cutoff
  filtered_bitmap[1, , ][above_cutoff] <- as.raw(color_1[1])   # R
  filtered_bitmap[2, , ][above_cutoff] <- as.raw(color_1[2])    # G
  filtered_bitmap[3, , ][above_cutoff] <- as.raw(color_1[3])   # B (Color_1)

  below_cutoff <- !above_cutoff
  filtered_bitmap[1, , ][below_cutoff] <- as.raw(color_2[1])    # R
  filtered_bitmap[2, , ][below_cutoff] <- as.raw(color_2[2])   # G
  filtered_bitmap[3, , ][below_cutoff] <- as.raw(color_2[3])   # B (Color_2)


  filtered_image <- magick::image_read(filtered_bitmap)
  #print(as.raw(color_2))
  return(filtered_image)
}



