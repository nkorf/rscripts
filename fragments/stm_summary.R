# Provide an STM object as an input 
# This is a wrapper from stm's summary function of a topic model that can make 
# a researcher's life easier for printing a table.

# STM2df 
# Gets a dataframe to include in a nice table 
# use in conjuction with Kable to print in rmarkdown
# object : The STM object 
# n: the number of words to print (defaults to 7)
# custom.labels : The vector of custom labels to assign after the identification 
# of the labels is done
# type: The type of words to print (defaults to FREX ), other options are: 
# "PROB","LIFT","SCORE"

STMSolution2df <- function(object,n=7,custom.labels=c(),type=c("PROB","FREX",
                                                               "LIFT","SCORE"), ...){
    #do we have custom labels 
    custom_labels_n <- length(custom.labels) 1
   
    if(custom_labels_n<1){
       stop("No vector of custom labels supplied")
    }
    
    #number of topics 
    topicNum <- object$settings$dim$K
    
    if(!(custom_labels_n==topicNum)){
       stop("The number of custom labels supplied is not equal to the topic solution")
    }
    
    toreturn <- data.frame()
    topicSolution <- labelTopics(object,n = n)
    
    proportions <- colMeans(object$theta[,1:object$settings$dim$K])
    type_index <- 2 ; 
    if(type == "PROB"){
       type <- 1 
    } else if(type == "FREX"){
       type <- 2
    } else if(type == "LIFT"){
       type <- 3
    } else if(type == "SCORE"){
       type <- 4
    }
         
    for(i in 1:topicNum){
       data_h <- tibble(
         n_topic  = i,    
         label_h  = custom.labels[i],
         frex_words = paste(topicSolution[[type]][i,],collapse = ", "),
         proportion_h = 100 * proportions[i]
       )
       toreturn <- bind_rows(toreturn,data_h)
       
    }
    colnames(toreturn) <- c("#","Topic",type,"Prop (%)")
    
    return(toreturn)
}
