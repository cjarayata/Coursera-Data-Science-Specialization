setwd("~/Desktop/datasciencecoursera/2. R Programming")
library(dplyr)
library(magrittr)
# directory <- "specdata"
# pollutant <- "nitrate"
# id <- 1:5

complete <- function(directory, id = 1:332){
      all.files <- list.files(directory, full.names = T)
      dat <- data.frame()
      for (i in id) {
            dat <- rbind(dat, read.csv(all.files[i]))
      }
      complete.summary <- 
            as.data.frame(
            dat %>%
                  mutate(complete = complete.cases(dat)) %>%
                  group_by(ID) %>%
                  summarise(nobs = sum(complete))
      )
      complete.summary
}
