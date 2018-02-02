# make some fake data and store in a db
library(data.table)
library(magrittr)
dat <- data.table(SNP = paste("rs",1:1e6)
                  , CHR = sample(1:22, 1e6, replace = T)
                  , POS = sample(1:1e6, 1e6, replace = T)
                  , BETA = rnorm(1e6, 0, sd = 1)
                  , SE = abs(rnorm(1e6,0,1))) %>% .[,P:=2*pnorm(-abs(BETA/SE))] %>% .[P != 0]
