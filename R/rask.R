#' Send Google search for keyword. If no keyword provided, will search on the latest error or warning.
#'
#' @param keyword A string or vector of strings.
#' @param warning A Boolean.
#' @return NULL, opens a web browser window for the search
#' @examples
#' ask_google("Pickle Rick")
#' ask_google()
#' @export
#' @import utils
ask_google <- function(keyword = NA, warning = FALSE) {
  if (all(is.na(keyword))) {
    if (warning) {
      keyword <- get_warning()
    } else {
      keyword <- get_error()
    }
  }
  keyword <- clean_keyword(keyword)
  browseURL(sprintf("https://www.google.com/search?q=%s", URLencode(keyword)))
}

#' Send search for keyword to Stackoverflow. If no keyword provided, will search on the latest error or warning.
#'
#' @param keyword A string or vector of strings.
#' @param warning A Boolean.
#' @return NULL, opens a web browser window for the search
#' @examples
#' ask_stackoverflow("R shiny")
#' ask_stackoverflow()
#' @export
#' @import utils
ask_stackoverflow <- function(keyword = NA, warning = FALSE) {
  if (all(is.na(keyword))) {
    if (warning) {
      keyword <- get_warning()
    } else {
      keyword <- get_error()
    }
    keyword <- clean_keyword(keyword)
    # add an R tag since it came from R session
    keyword <- paste(keyword, "[R]")
  } else {
    keyword <- clean_keyword(keyword)
  }
  browseURL(sprintf("https://www.stackoverflow.com/search?q=%s", URLencode(keyword)))
}
