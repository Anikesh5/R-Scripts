library("tidyverse")
library("seqinr")
library("DNAshapeR")
#Rv0022c <- read.delim("output_Rv0022c.fasta.4_dnase_ave")
#Rv0022c
#ggplot(data = Rv0022c)+
 # geom_histogram(mapping = aes(x = X.nan), stat = "identity")
#ggplot(Rv0022c, aes(x=X.nan)) + geom_histogram()

#Rv0022c <- read.fasta("output_Rv0022c.fasta")
#Rv0022c
#str("Rv0022c")
#Rv0022c[1]

setwd("~/Desktop/DNA_Struc_Prop_calc/scripts/multiFASTA_500/onestring")

# calculating average and plotting 

z <- read.delim("final_Rv0022c_500_dnase", header = FALSE)

avg <- colMeans(z, na.rm = T)

vec1 <- c(avg[1:1000])
vec2 <- c(-500:500)   #change the x-axis as per the requirement 

maxlength = max(length(vec1), length(vec2))

vec1 = c(vec1, rep(NA, maxlength - length(vec1)))
vec2 = c(vec2, rep(NA, maxlength - length(vec2)))

vec3 <- data.frame(vec1,vec2)

ggplot(data = vec3, mapping = aes(x = vec2, y = vec1))+
  geom_line(size=0.3)+ xlab("position")+ ylab("DNaseI") +
  theme_classic()+
  ggtitle("Lsr2 NPP")



