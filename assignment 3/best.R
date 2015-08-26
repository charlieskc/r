best <- function(state, outcome) { 
	i=0
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
	

	minValue = min(df_subset[,i], na.rm=TRUE)
	##print(minValue)
	##df_subset[,i] <- as.numeric(df_subset[,i])

	result <- subset(df_subset, df_subset[i] <= unname(minValue))
	##print(result);
	result[with(result,order(Hospital.Name)), ]
	##return(result$Hospital.Name)

	return(head(result,1)$Hospital.Name)
}