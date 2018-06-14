# corr function

# directory <- "specdata"
# threshold <- 200

corr <- function(directory, threshold = 0) {
      source("complete.R")
      table <- complete(directory, 1:332)
      over.thresh <- table[which(table$nobs > threshold), ]
      good.ids <- over.thresh$ID
      dat <- data.frame()
      all.files <- list.files(directory, full.names = T)
      for (i in good.ids) {
            dat <- rbind(dat, read.csv(all.files[i]))
      }
      complete.data <- dat[complete.cases(dat), ]
      correlation.table <- ddply(complete.data, .(ID), summarise,
            correlation = cor(sulfate, nitrate))
      correlation.table$correlation
      
}

