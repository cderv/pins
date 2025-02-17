#' Delete a pin
#'
#' Delete a pin, removing it from the board
#'
#' @inheritParams pin_read
#' @param names The names of one or more pins to delete
#' @export
#' @examples
#' board <- board_temp()
#' board %>% pin_write(1:5, "x")
#' board %>% pin_write(mtcars)
#' board %>% pin_write(runif(1e6), "y")
#' board %>% pin_list()
#'
#' board %>% pin_delete(c("x", "y"))
#' board %>% pin_list()
pin_delete <- function(board, names) {
  for (name in names) {
    board_pin_remove(board, name)
  }

  ui_viewer_updated(board)

  invisible(board)
}
