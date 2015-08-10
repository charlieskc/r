pollutantmean <- function(directory, pollutant, id = 1:332) {
	files <- list.files(directory, pattern="*.csv")
data <- NULL;
for(i in id){
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
}

#colMeans(data[pollutant], na.rm=TRUE);
mean(unlist(data[pollutant]), na.rm = TRUE)

}

testMean <- function() {

	pollutantmean("specdata","sulfate", 1:10)
	pollutantmean("specdata","nitrate", 70:72)
	pollutantmean("specdata","nitrate", 23)
	
	
}