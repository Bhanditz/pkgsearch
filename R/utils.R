
`%||%` <- function(l, r) if (is.null(l)) r else l

check_count <- function(x) {
  if (!is.numeric(x) || length(x) != 1 || as.integer(x) != x || x < 0) {
    stop(x, " is not a count", call. = FALSE)
  }
}

check_string <- function(x) {
  if (!is.character(x) || length(x) != 1 || is.na(x)) {
    stop(x, " is not a string", call. = FALSE)
  }
}

`%+%` <- function(lhs, rhs) {
  check_string(lhs)
  check_string(rhs)
  paste0(lhs, rhs)
}

add_class <- function(x, class_name) {
  if (! inherits(x, class_name)) {
    class(x) <- c(class_name, attr(x, "class"))
  }
  x
}

pluck <- function(list, field) {
  sapply(list, "[[", field)
}

`%s%` <- function(lhs, rhs) {
  check_string(lhs)
  list(lhs) %>%
    c(as.list(rhs)) %>%
    do.call(what = sprintf)
}

map <- function(.x, .f, ...) {
  lapply(.x, .f, ...)
}

map_mold <- function(.x, .f, .mold, ...) {
  out <- vapply(.x, .f, .mold, ..., USE.NAMES = FALSE)
  names(out) <- names(.x)
  out
}

map_lgl <- function(.x, .f, ...) {
  map_mold(.x, .f, logical(1), ...)
}

map_int <- function(.x, .f, ...) {
  map_mold(.x, .f, integer(1), ...)
}

map_dbl <- function(.x, .f, ...) {
  map_mold(.x, .f, double(1), ...)
}

map_chr <- function(.x, .f, ...) {
  map_mold(.x, .f, character(1), ...)
}

meta <- function(x) {
  attr(x, "metadata")
}

`meta<-` <- function(x, value) {
  attr(x, "metadata") <- value
  x
}