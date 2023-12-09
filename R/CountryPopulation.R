#' Country Population
#'
#'Takes in a character string that is a country name and returns a graph of
#'the population of that country over time.
#'
#'
#' @param CountryInput A string that spells out a country
#' @return A graph that represents the country's population from 1950-2020
#' @export
CountryPopulation <- function(CountryInput){
  CountryExists <- WorldPopulation %>% filter(CountryName == CountryInput)

  if(nrow(CountryExists) == 0){
    stop("Country does not exist.")
  }

  WorldPopulationFunc <- WorldPopulation %>%
    pivot_longer(2:72, names_to="Year", values_to="Population") %>%
    filter(CountryName == CountryInput) %>%
    mutate_at( vars( matches('Pop')), as.numeric)

  WorldPopulationSlay <- WorldPopulationFunc %>%
    ggplot(aes(x=Year, y=Population)) + geom_point(size=3)

  return(WorldPopulationSlay)
}

