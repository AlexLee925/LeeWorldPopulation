#Check to see if country entered exists in CountryNames list. If not, throw
#error.
test_that('Check for errors', {
  expect_error(CountryPopulation("slayslay"))
  expect_error(CountryPopulation("bootsthehousedown"))
  expect_error(CountryPopulation("mama"))
})
