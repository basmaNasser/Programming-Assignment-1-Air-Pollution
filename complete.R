complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        
        files <- list.files(directory,full.names=TRUE)

        dataframe <- function(id){
                for (f in seq_along(files)) { 
                      
                        if (f == id)  {
                                
                                data <- na.omit(read.csv(files[f]))
                                nobs <-  nrow(data)
                                #d <- list(id=id,nobs=nobs)
                               # return(c(d$id, d$nobs))
                               d <- data.frame(id,nobs)
                                return(d)
                                
                        }
                        
                        }
                
                  
                
                }
        
for (i in id){  
d <- dataframe(i)
      #ids <- df[1]
      #nobs <- df[2]

  write.table(d, file="data1.csv", append=T, sep=",", col.names = FALSE,row.name=FALSE)
   
datanew <- read.table(file="data1.csv",sep=",")
colnames(datanew) = c('id', 'nobs')
write.table(datanew, file="datar.csv", sep=",",col.names = TRUE,row.name=FALSE)


      #print(  data.frame(ids,nobs))     
}
datanew2 <- read.csv(file="datar.csv")

return(datanew2)

#print(adply(df,1,dataframe,.expand = TRUE))
}
