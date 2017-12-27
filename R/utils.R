# cache latest error since it's removed if there had been any successes after the error
cache_rask_env <- new.env()

get_error <- function() {
  error_message <- geterrmessage()
  if (error_message == "subscript out of bounds") {
    # we have lost the last error due to recent successful executions, so retrieve from cache
    if (exists("cache_latest_error", envir=cache_rask_env)) {
      error_message <- get("cache_latest_error", envir=cache_rask_env)
    } else {
      error_message <- NA
    }
  } else {
    assign("cache_latest_error", error_message, envir=cache_rask_env)
  }
  error_message
}

get_warning <- function() {
  last_warning <- tail(warnings(), 1)
  if (is.null(last_warning)) return(NULL)
  names(last_warning)
}

clean_keyword <- function(keyword) {
  # try my best to make this input into a string
  if (length(keyword) > 1) keyword <- paste(keyword, collapse = " ")
  if (is.null(keyword) || is.na(keyword)) keyword <- ""
  gsub("\n", " ", as.character(keyword))
}
