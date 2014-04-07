#' Checks if an argument is a flag
#'
#' A flag a a single logical value which is not missing.
#'
#' @templateVar id Flag
#' @template testfuns
#' @param na.ok [\code{logical(1)}]\cr
#'  Are missing values allowed? Default is \code{FALSE}.
#' @export
assertFlag = function(x, na.ok = FALSE, .var.name) {
  amsg(testFlag(na.ok, FALSE), "na.ok")
  amsg(testFlag(x, na.ok), vname(x, .var.name))
}

#' @rdname assertFlag
#' @export
isFlag = function(x, na.ok = FALSE) {
  amsg(testFlag(na.ok, FALSE), "na.ok")
  isTRUE(testFlag(x, na.ok))
}

#' @rdname assertFlag
#' @export
asFlag = function(x, na.ok = FALSE, .var.name) {
  assertFlag(x, na.ok = na.ok, .var.name = vname(x, .var.name))
  x
}

testFlag = function(x, na.ok = FALSE) {
  if(length(x) != 1L || !is.logical(x) || (!na.ok && is.na(x)))
    return("'%s' must be a flag")
  return(TRUE)
}
