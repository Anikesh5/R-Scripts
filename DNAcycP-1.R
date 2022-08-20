library(tidyverse)

setwd("~/Desktop/DNAcycP_output")
mydir = "Rv0022c"
Input_files <- c(list.files(path=mydir, pattern = "*.txt", full.names = T))
#Input_files
#Input_files[5]

readINPUT <- function(Input_files) {
  input1 <- read.delim(Input_files,
                     sep = ',', header = T)
  input2 <- data.frame(input1[c(1:1952),c(1:2)])
}

c_score_plots = list()

for (i in Input_files) {
  
  c_plot <- readINPUT(i)
  temp_plot = ggplot(c_plot, mapping = aes(x = posision, y = c_score_norm))+
    geom_line()+
    theme_classic()+
    geom_vline(xintercept=c(1000), linetype="dotted")+
    geom_hline(yintercept = c(0), linetype='dashed')+
    ggtitle(file)
  
  ggsave(temp_plot, file=paste0("plot_", i,".png"), width = 14, height = 10, units = "cm", path = "~/Desktop//DNAcycP_output/Rv0022c/plots")
  
  }


