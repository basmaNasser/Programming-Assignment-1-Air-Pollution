corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        source('complete.R')
        d <- complete(directory)
        
        nobs_gt_threshold <- d$id[d$nobs > threshold]
       
        files <- list.files(directory,full.names=TRUE)
        
        readdata <- function(id){
                for (f in seq_along(files)) { 
                        
                        if (f == id)  {
                                
                                data <- na.omit(read.csv(files[f]))
                                return(data)
                                
                        }            
                }
        }
        
        output <- vector(mode='numeric')
      
        for (i in nobs_gt_threshold) {
                data <- readdata(i)
                
                correlated_data <- cor(x=data$sulfate, y=data$nitrate)
                output <- c(output, correlated_data)
        } 
        
        output
       
        
}
