rankhospital <- function(state, outcome, num = "best") {
	
	i=0
	col=""
	if(outcome == "heart attack"){
		i=11
	}
	else if(outcome == "heart failure"){
		i=17
	}
	else if(outcome == "pneumonia"){
		i=23
	}
	else{
		stop("invalid outcome")
	}
	
		
	df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	df_subset <- subset(df, df$"State"==state)
	df_subset[,i] <- as.numeric(df_subset[,i])
	##print(df_subset[,i]);

	##print(df_subset)
	if(nrow(df_subset) == 0){
		stop("invalid state")
	}
	##minValue = sapply(df_subset, min)[i]
	

	##minValue = min(df_subset[,i], na.rm=TRUE)
	##print(minValue)
	##df_subset[,i] <- as.numeric(df_subset[,i])

	##result <- subset(df_subset, df_subset[i] <= unname(minValue))
	##print(result);
	result <- df_subset[with(df_subset,order(df_subset[,i], Hospital.Name)), ]
	result <- subset(result,!is.na(result[,i]))
	if(num == "best")
		result <- result[1,]
	else if(num == "worst")
		result <- tail(result,n=1L)
	else
		result <- result[num,]
	return(result$Hospital.Name);

}
