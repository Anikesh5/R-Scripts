library("gplots")
library("tidyverse")
a <- data.matrix(heatmap_UR.CR)
a
heatmap.2(a, main = "Variation of Structural Property", margins = c(10,12),
          cexRow = 0.5, Rowv = F, Colv = F, scale = "none", key = F)

?colorRampPalette
c <- colorRampPalette(c("yellow", "white", "blue"))
heatmap.2(a, col = b, main = "Variation of Structural Property", trace = "none", margins = c(10,12),
          cexRow = 0.5, Rowv = F, Colv = F, scale(c(1:0)) , key = F)source("https://bioconductor.org/biocLite.R")



if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("ComplexHeatmap")

library(ComplexHeatmap)
#a <- read.csv("heatmap_UR-CR.csv", sep = ',', header = T, row.names = 1)

b <- read.table("heatmap_UR-CR.csv", sep=",", quote="", header=T)

head(b)
dim(b)
nrow(b)
ncol(b)
  matrix1 <- data.matrix(b[ ,c(2:22)])

class(b)
class(matrix1)

head(matrix1)

shape_info <- data.frame(shape = b$Structural_Property)
shape_info

heatmap(matrix1)
d <- colorRampPalette(c("yellow", "white", "blue"))

matrix2 <- t(matrix1)
heatmap(matrix2, Colv = NA, Rowv = NA, scale_alpha(range = c(0.000000000000000000000001:1)))

colors = c(seq(0.0000000000000000000001,0.0000001,length=100),seq(0.,0.5,length=100),seq(0.5,6,length=100))


heatmap.2(matrix2, Colv = F, Rowv = F, col = d, symm = F, symkey = F,symbreaks = F, key = T, main = "UR-CR", trace = "none",
          scale = "none")


















