if(!file.exists(glad_report)){
  
#############################################################
####################  CRITERES DE SELECTION ALERTES -> EMD
#############################################################
df        <- read.table(glad_stt_file)
names(df) <- c("id","size","nodata","val1","potential","confirmed")

df$confirmed_select <- 0
df$potential_select <- 0

df[df$size > emd_size & df$confirmed != 0 ,"confirmed_select"] <- df[df$size > emd_size & df$confirmed != 0 ,"id"]
df[df$size > emd_size & df$potential != 0 ,"potential_select"] <- df[df$size > emd_size & df$potential != 0 ,"id"]

write.table(file=glad_rcl_file,
            df[,c("id","confirmed_select","potential_select","size")],sep=" ",quote=FALSE, col.names=FALSE,row.names=FALSE)

print_alerte <- function(x){
  cat(paste("Nombre d'alertes >",round(x*.09,digits = 1),"ha :",
             nrow(df[df$size > x & df$confirmed != 0,]),
             nrow(df[df$size > x & df$potential != 0,])
             ),collapse="\n")
}

quantile(df[df$nodata ==0,"size"],c(0.5,.95,.99,.995))
selection <- df[df$size > emd_size & df$nodata == 0,]


sink(glad_report)
invisible(sapply(c(1,6,11,55),print_alerte))

cat(paste0("Nombre d'alertes selectionnées : ",nrow(selection)))
sink()
} 