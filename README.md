# rask
send error / warning / whatever to google or stackoverflow from within R

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

If what we got was a warning, specify a `warning=TRUE` argument as in  `ask_google(warning=TRUE)`. This will send a Google search for the latest warning you have in the history.

Similary, use `ask_stackoverflow` to send search to Stack Overflow. If no keyword is provided, `ask_stackoverflow` behaves the same as `ask_google`, except that it also adds a `[R]` tag to the end of the error / warning message to specify the R tag.

## For some reason, I just want to search stuff from R

If the `keyword` argument is provided, it will be used as search keyword. `ask_*` will try to flatten whatever that's provided into a string. For example,

```{r, eval=FALSE}
ask_google("Rick and Morty, Pickle Rick")
```