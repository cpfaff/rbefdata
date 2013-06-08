context("Get a dataset with bef.portal.get.dataset()")

test_that("it throws an error if the credentials are invalid", {
  bef.options(url="http://befdatadevelepment.biow.uni-leipzig.de")
  bef.options(user_credentials="invalid")
  expect_error(bef.portal.get.dataset(dataset_id=7), "*not found or not accessible*")
})

test_that("it returns a dataframe", {
  bef.options(url="http://befdatadevelepment.biow.uni-leipzig.de")
  bef.options(user_credentials="Yy2APsD87JiDbF9YBnU")
  expect_that(bef.portal.get.dataset(dataset_id=7), is_a("data.frame"))
})

