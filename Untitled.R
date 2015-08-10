complete1 <- function(directory, idvec = 1:332) {

    #' @brief description

    #'

    #' @author Menglong Tan

    #' @param a description

    #' @return return blabla

    #' @callGraphPrimitives

    df <- data.frame(id = integer(), nobs = integer())

    for (id in idvec) {

        filename <- paste(directory, "/",

                          sprintf("%03d", as.integer(id)),

                          ".csv", sep = "")

        data <- read.csv(filename)

        nd <- data.frame(id = id,

                         nobs = nrow(na.omit(data)))

        df <- rbind(df, nd)

    }

    df

}
