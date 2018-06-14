# Week 2 Assignment

setwd("~/Desktop/datasciencecoursera/2. R Programming")

# directory <- "specdata"
# pollutant <- "nitrate"
# id <- 1:5


pollutantmean <- function(directory, pollutant, id = 1:332) {
      all.files <- list.files(directory, full.names = T)
      dat <- data.frame()
      for (i in id) {
            dat <- rbind(dat, read.csv(all.files[i]))
      }
      pol <- dat[which(names(dat) == pollutant)]
      mean(pol[,1], na.rm = T)
}

# pollutantmean("specdata", "sulfate", 1:10)
# pollutantmean("specdata", "nitrate", 70:72)
