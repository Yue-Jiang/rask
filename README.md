# rask

[ɑːsk]

send error / warning / whatever to google or stackoverflow from within R

## Installation

If you don't have `devtools` installed yet, go ahead and install it. Then `rask` can be installed from github by `devtools::install_github("Yue-Jiang/rask")`.

The rask library provides two functions:

- `ask_google`
- `ask_stackoverflow`

## Why am I getting this error / warning?

The reason for providing these functions, is mainly to allow user to search for error or warning messages without having to select and copy the messages when they occur, find the browser, go to Google or Stack Overflow and paste them in. For example, this gives an error:

```{r, eval=FALSE}
a <- "Rick"
c(a, Morty)
```

```
Error: object 'Morty' not found
```

And we can ask google about this error message.

```{r, eval=FALSE}
ask_google()
```

This will open up a browser tab showing google search results of this error message. Unless there is a new error message, the current error message will be preserved, in case you would like to try your luck on Stack Overflow instead later.

If what we got was a warning, specify a `warning=TRUE` argument as in  `ask_google(warning=TRUE)`. This will send a Google search for the latest warning you have in the history.

Similary, use `ask_stackoverflow` to send search to Stack Overflow. If no keyword is provided, `ask_stackoverflow` behaves the same as `ask_google`, except that it also adds a `[R]` tag to the end of the error / warning message to specify the R tag.

## For some reason, I just want to search stuff from within R

If the `keyword` argument is provided, it will be used as the search keyword. `ask_*` will try to flatten whatever that's provided into a string. For example,

```{r, eval=FALSE}
ask_google(c("Rick and Morty", "Pickle Rick"))
```

That's one of my favorite episodes.
