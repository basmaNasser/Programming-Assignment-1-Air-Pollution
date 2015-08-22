pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        files <- list.files(directory,full.names=TRUE)
        for (f in seq_along(files)) { 
                for (i in id){        
                        if (f == i)  {
                                                                
                                data <- read.csv(files[f])
                        
 write.table(data[pollutant], file="data1.csv", append=T, sep=",", col.names = FALSE,row.name=FALSE)

                              }
                }
                       
}

datanew <- na.omit(read.table(file="data1.csv"))

pollutantd <- datanew[,1]
print(mean(pollutantd))
file.remove("data1.csv")

}
