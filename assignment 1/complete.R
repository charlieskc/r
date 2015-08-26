complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        ##setwd(directory);
resultframe <- data.frame(id = numeric(0), nobs = numeric(0))
##print(resultframe);

for(i in id){
	data <- NULL;
	##construct filename according to the list id
	if(i<10){
		filename <- paste('00',i,'.csv',sep="");
		}
	else if(i<100){
		filename <- paste('0',i,'.csv',sep="");
		}
		
	else {
		filename <- paste(i,'.csv',sep="");
		}
	##Load mulitples files into the dataframe	
		data <- rbind(data, read.csv(paste(directory, filename, sep="/")))
		 ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
		completeData <- data[complete.cases(data),];
		resultrow <- c(i,nrow(completeData))
		##print(resultrow);
		##resultframe <- rbind (resultframe, resultrow);
		resultframe[nrow(resultframe)+1,] <- resultrow;
}
return(resultframe)
}


testComplete <- function() {
	complete("specdata", 1)
	complete("specdata", c(2, 4, 8, 10, 12))
	complete("specdata", 30:25)
	complete("specdata", 3)

}
