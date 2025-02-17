# can't pin_read() file that was pin_uploaded()

    Code
      pin_read(board, "test")
    Error <rlang_error>
      Pin created with `pin_upload()`
      i Retrieve uploaded paths with `pin_download()`

# useful errors on bad inputs

    Code
      pin_write(mtcars)
    Error <rlang_error>
      `board` must be a pin board
    Code
      pin_write(board, mtcars, name = 1:10)
    Error <rlang_error>
      `name` must be a string
    Code
      pin_write(board, mtcars, name = "x/y")
    Error <rlang_error>
      `name` can not contain slashes
    Code
      pin_write(board, mtcars, name = "mtcars", type = "froopy-loops")
    Error <rlang_error>
      `type` must be one of "rds", "json", "arrow", "pickle", or "csv".
    Code
      pin_write(board, mtcars, name = "mtcars", metadata = 1)
    Error <rlang_error>
      `metadata` must be a list

# pin_write() noisily generates name and type

    Code
      b <- board_temp()
      pin_write(b, mtcars)
    Message <message>
      Guessing `name = 'mtcars'`
      Guessing `type = 'rds'`
      Creating new version 'dfa6c1c109362781'

# can request specific hash

    Code
      b <- board_temp()
      pin_write(b, mtcars, name = "mtcars", type = "rds")
    Message <message>
      Creating new version 'dfa6c1c109362781'
    Code
      pin_read(b, "mtcars", hash = "ABCD")
    Error <rlang_error>
      Specified hash 'ABCD' doesn't match pin hash 'dfa6c1c109362781'

