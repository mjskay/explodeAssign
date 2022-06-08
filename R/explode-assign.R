#' @export
V = structure(list(), class = "V")

# have to replace `*` instead of just implementing
# a method to handle cases where x isn't defined yet
#' @export
`*` = function(e1, e2) {
  if (inherits(e1, "V")) {
    structure(list(x = substitute(e2), env = parent.frame()), class = "V*x")
  } else {
    base::`*`(e1, e2)
  }
}

#' @export
`|` = function(e1, e2) {
  if (inherits(e2, "V*x")) {
    invisible(eval(bquote(.(e2$x) <- .(e1)), envir = e2$env))
  } else {
    base::`|`(e1, e2)
  }
}
