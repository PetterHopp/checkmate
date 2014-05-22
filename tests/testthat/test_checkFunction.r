context("checkFunction")

test_that("checkFunction", {
  myfun = function(x, y, ...) x + y

  expect_false(testFunction(NULL))
  expect_true(testFunction(identity))
  expect_true(testFunction(myfun))
  # FIXME this does not work ... is this a testthat issue?
  # expect_true(testFunction("myfun"))
  expect_false(testFunction(fff))
  expect_false(testFunction("fff"))

  expect_true(testFunction(myfun, args = "x"))
  expect_true(testFunction(myfun, args = "..."))
  expect_true(testFunction(myfun, args = "x", ordered=TRUE))
  expect_true(testFunction(myfun, args = "y"))
  expect_true(testFunction(myfun, args = c("x", "y")))
  expect_true(testFunction(myfun, args = c("x", "y", "...")))
  expect_true(testFunction(myfun, args = c("y", "x")))
  expect_true(testFunction(myfun, args = c("x", "y"), ordered=TRUE))
  expect_false(testFunction(myfun, args = "z"))
  expect_false(testFunction(myfun, args = c("y"), ordered=TRUE))
  expect_false(testFunction(myfun, args = c("y", "x"), ordered=TRUE))


  expect_true(assertFunction(myfun))
  expect_error(assertFunction(fff), "not found")
  expect_error(assertFunction(myfun, "z"), "formal arguments")
  expect_error(assertFunction(myfun, "y", ordered=TRUE), "first formal arguments")
})