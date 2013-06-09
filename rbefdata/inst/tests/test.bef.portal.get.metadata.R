context("Get metadata with bef.portal.get.metadata()")

test_that("it downloads metadata for john doe", {
  bef.options(url="http://befdatadevelepment.biow.uni-leipzig.de")
  bef.options(user_credentials="")
  expect_that(bef.portal.get.metadata(dataset_id=7), is_a("list"))
})

test_that("it throws an error if eml is not found", {
  bef.options(url="http://befdatadevelepment.biow.uni-leipzig.de")
  expect_error(bef.portal.get.metadata(dataset_id=1000), "failed to load HTTP resource")
})

test_that("it gets metadata by id", {
  bef.options(url="http://befdatadevelepment.biow.uni-leipzig.de")
  bef.options(user_credentials="invalid")
  expect_that(bef.portal.get.metadata(dataset_id=7), is_a("list"))
})

test_that("it gets metadata from an eml file", {
  expect_that(bef.portal.get.metadata(file="../fixtures/test.eml"), is_a("list"))
})

