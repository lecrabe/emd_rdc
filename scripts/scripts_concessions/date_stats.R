if(!file.exists(date_stt_file)){
#############################################################
####################  GET DATE STATS PER PATCH
#############################################################
system(sprintf("oft-stat -i %s -o %s -um %s ",
               glad_date_bb,
               date_stt_file,
               glad_clump
))
}