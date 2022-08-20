library(tidyverse)
library(seqinr)
library(ggpubr)

##   working directories for the shape profiles' values   ###
#/home/anikesh/Desktop/TFs/MTb/chip_center_data_of_TFs/Working_TFs/OneString/Output_with_unique_headers/final
#/home/anikesh/Desktop/DNA_Struc_Prop_calc/scripts/multiFASTA_500/onestring/finals

setwd("/home/anikesh/Desktop/DNA_Struc_Prop_calc/scripts/multiFASTA_500/onestring")
mydir = "finals"

Input_files <- c(list.files(path=mydir, pattern = "*nucle", full.names = T))

readINPUT <- function(Input_files) {
  input1 <- read.delim(Input_files,
                       sep = '\t', header = F)   #change the separator
}

for (i in Input_files) {
  
  avg <- colMeans(readINPUT(i), na.rm = T)
  
  avg_data <- c(avg[1:1000])
  
  nt_position <- c(-500:500)   #change the x-axis as per the requirement 
  
  maxlength = max(length(avg_data), length(nt_position))
  
  avg_data = c(avg_data, rep(NA, maxlength - length(avg_data)))
  nt_position = c(nt_position, rep(NA, maxlength - length(nt_position)))
  
  DNA_Shape_Table <- data.frame(avg_data,nt_position)
  
  ## change the UR, CR, DR lengths for the respective files  ##
  UR <- data.frame("NPP" = DNA_Shape_Table[c(201:301),c(1)], "Region" = "1_UR")
  CR <- data.frame("NPP" = DNA_Shape_Table[c(451:551),c(1)], "Region" = "2_CR")
  DR <- data.frame("NPP" = DNA_Shape_Table[c(701:801),c(1)], "Region" = "3_DR")
  
  xData <- rbind(UR,CR,DR)
  
  my_comparisons <- list(c("1_UR", "2_CR"), c("2_CR", "3_DR"))
  
  d <- wilcox.test(my_comparisons)
  f <- cbind((i),d)
  
}
  
