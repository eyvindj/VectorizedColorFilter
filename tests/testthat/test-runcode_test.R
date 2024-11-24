#' Test Script for VectorizedColorFilter
#'
#' This script runs tests on the functions `filter_grayscale` and `filter_twocolor`
#' using example images. The test images are loaded, processed with both grayscale
#' and two-color filters, and the results are displayed or saved as new image files.
#'
#' @details
#' The script requires the `magick` package for reading and manipulating image files.
#' It assumes that the `filter_grayscale` and `filter_twocolor` functions are
#' correctly implemented in the package.
#'
#' The `filter_grayscale` function converts an image to grayscale using standard
#' RGB-to-grayscale conversion. The `filter_twocolor` function applies a two-color
#' filter, where you can specify the colors and an optional cutoff level.
#'
#' @examples
#' \dontrun{
#' testimage <- system.file("extdata", "test.jpg", package = "VectorizedColorFilter")
#' testimage2 <- system.file("extdata", "test2.jpg", package = "VectorizedColorFilter")
#' gray1 <- filter_grayscale(testimage)
#' gray2 <- filter_grayscale(testimage2)
#' twocolor1 <- filter_twocolor(testimage, color1="yellow", color2="lightblue")
#' twocolor2 <- filter_twocolor(testimage2, color1="yellow", color2="lightblue")
#' }
#'
#' @import magick
#' @export
library(magick)
library(usethis)
library(testthat)

testimage <- system.file("extdata", "test.jpg", package = "VectorizedColorFilter")
testimage2 <- system.file("extdata", "test2.jpg", package = "VectorizedColorFilter")

testimage <- magick::image_read(testimage)
testimage2 <- magick::image_read(testimage2)

gray1 <- filter_grayscale(testimage)
gray2 <- filter_grayscale(testimage2)

twocolor1 <- filter_twocolor(testimage, color1="yellow", color2="lightblue")
twocolor2 <- filter_twocolor(testimage2, color1="yellow", color2="lightblue")

test_that("grayscale filter works", {
  gray_test <- filter_grayscale(testimage)
  expect_s3_class(gray_test, "magick-image")
})

test_that("two-color filter works", {
  twocolor_test <- filter_twocolor(testimage, color1="yellow", color2="lightblue")
  expect_s3_class(twocolor_test, "magick-image")
})
