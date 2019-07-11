
library(tidyverse)

inputdir <- "./data/"
inputfile <- "00e2ced275084228a4922c614e31dad7.RData"
inputpath <- paste(inputdir,inputfile, sep="")

inputname <- strsplit(inputfile, ".", fixed=TRUE)
inputname2 <- inputname[[1]][1]

outputdir <- "./data/"


load(inputpath)


#There are 5 simulation results stored in one RData file.
index <- 0  # Each simulation is just stored with a different index in res variable
for (sim in res) {
  
  index <- index + 1
  
  metadata <- sim$head
  data <- sim$out
  
  data_filtered <- filter(data, Wheat.Grain.Wt >= 300)
  num_rows <- nrow(data_filtered)
           
  if (num_rows >= 1) {
    
    #set the output name to the input name with simulation index added to the end
    outputname <- paste(inputname2,"_",index, sep="")
    
    sim_filtered <- list(metadata = metadata, data_filtered = data_filtered, num_rows = num_rows)

    #rename the elements within the list to have the output name as a prefix
    #this is done so we one day we can load all the simulations into the same environment and not overwrite each other. 
    new_name_metadata <- paste(outputname, "_meta", sep="")
    new_name_data_filtered <- paste(outputname, "_data", sep="")
    new_name_num_rows <- paste(outputname, "_num_rows", sep="")
    names(sim_filtered) <- c(new_name_metadata, new_name_data_filtered, new_name_num_rows)

    outputfile <- paste(outputname,".RData", sep="") 
    outputpath <- paste(outputdir, outputfile, sep="")

    save(sim_filtered, file=outputpath)
    
    }
}



#help("setNames")

# res[[1]]$head
# view(res[[1]]$head)
# view(res[[1]]$out)
# 
# names(res[])
# 
# view(apsim)
# help("names")
# typeof(res)
# typeof(res[[1]]$head)
# typeof(res[[1]]$out)