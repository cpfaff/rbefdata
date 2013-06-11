context("Check set and get bef.options()")

test_that("the right default options are set", {
  expect_that(bef.options("url"), matches("http://befdatadevelepment.biow.uni-leipzig.de"))
  expect_that(bef.options("tematres_url"), matches("http://befdataproduction.biow.uni-leipzig.de:7070/vocab/index.php"))
  expect_that(bef.options("tematres_service_url"), matches("http://befdataproduction.biow.uni-leipzig.de:7070/vocab/services.php"))
  expect_that(bef.options("download_dir"), matches("downloads"))
})
