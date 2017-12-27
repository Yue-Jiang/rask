get_error <- function() {
    error_message <- geterrmessage()
}

get_warning <- function() {
    last_warning <- tail(warnings(), 1)
    if (is.null(last_warning))
        return(NULL)
    names(last_warning)
}

clean_keyword <- function(keyword) {
    # try my best to make this input into a string
    if (length(keyword) > 1)
        keyword <- paste(keyword, collapse = " ")
    if (is.null(keyword) || is.na(keyword))
        keyword <- ""
    as.character(keyword)
}
