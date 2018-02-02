# make some fake data and store in a db
library(data.table)
library(magrittr)
library(dplyr)
# dat1 <- data.table(SNP = paste0("rs",1:1e6)
#                   , CHR = sample(1:22, 1e6, replace = T)
#                   , POS = sample(1:1e6, 1e6, replace = T)
#                   , BETA = rnorm(1e6, 0, sd = 1)
#                   , SE = abs(rnorm(1e6,0,1))) %>% .[,P:=2*pnorm(-abs(BETA/SE))] %>% .[P != 0]
# 
# dat2 <- data.table(SNP = paste0("rs",1:1e6)
#                   , CHR = sample(1:22, 1e6, replace = T)
#                   , POS = sample(1:1e6, 1e6, replace = T)
#                   , BETA = rnorm(1e6, 0, sd = 1)
#                   , SE = abs(rnorm(1e6,0,1))) %>% .[,P:=2*pnorm(-abs(BETA/SE))] %>% .[P != 0]
# 
# # create the database
# 
# 
# mydb<- src_sqlite("GWAS.res.sqlite", create = TRUE) # create =TRUE creates a new database
# copy_to(mydb, df = dat1, temporary = F, name = "GWAS.data1", overwrite = T) # uploading data
# copy_to(mydb, df = dat2, temporary = F, name = "GWAS.data2", overwrite = T) # uploading data


mydb <- src_sqlite("GWAS.res.sqlite", create = FALSE)
src_tbls(mydb)

tab1 = tbl(mydb,"GWAS.data1")
head(tab1)
dat = filter(tab1, SNP == "rs500000")
print(dat)

dat = filter(tab1, CHR == 1 & POS >= 196993 & POS<= 196993)
print(dat)

rm(mydb)
