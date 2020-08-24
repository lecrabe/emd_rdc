################### GRAB BASE DATE NAME
base_date      <- substr(basename(alert_file),1,nchar(basename(alert_file))-9)


################### DEFINE ALL VARIABLES
fterr_file     <- paste0(tmp_dir,"tmp_fmask_",nom_territoire,".tif")

admin_shp      <- paste0(tmp_dir,"tmp_territoire.shp")
buff_shp       <- paste0(tmp_dir,"tmp_buffer.shp")
admin_tif      <- paste0(tmp_dir,"tmp_territoire.tif")
buff_tif       <- paste0(tmp_dir,"tmp_buffer.tif")

glad_date_file <- paste0(dirname(alert_file),"/",base_date,"_glad_date.tif")

glad_bb_file   <- paste0(tmp_dir,"tmp_glad_bb_",nom_territoire,".tif")
glad_date_bb   <- paste0(gld_dir,"glad_date_bb_",nom_territoire,".tif")
glad_clump_tmp <- paste0(tmp_dir,"tmp_glad_clump.tif")
glad_msk_file  <- paste0(gld_dir,base_date,"_glad_",nom_territoire,".tif")
glad_clump     <- paste0(gld_dir,base_date,"_clmp_",nom_territoire,".tif")
glad_stt_file  <- paste0(gld_dir,base_date,"_stat_glad_",nom_territoire,".txt")
date_stt_file  <- paste0(gld_dir,base_date,"_stat_date_",nom_territoire,".txt")
glad_rcl_file  <- paste0(gld_dir,base_date,"_recl_",nom_territoire,".txt") 
glad_report    <- paste0(stt_dir,base_date,"_report_",nom_territoire,".txt")

emd_rcl_tmp    <- paste0(tmp_dir,"tmp_emd.tif")
emd_conf_tmp   <- paste0(tmp_dir,"tmp_emd_conf.shp")
emd_potl_tmp   <- paste0(tmp_dir,"tmp_emd_potl.shp")

emd_file_tif   <- paste0(emd_dir,base_date,"_",nom_territoire,"_emd.tif") 
emd_file_shp   <- paste0(emd_dir,base_date,"_",nom_territoire,"_emd.shp")

emd_point_shp   <- paste0(emd_dir,base_date,"_",nom_territoire,"_centroid.shp")
emd_point_csv   <- paste0(emd_dir,base_date,"_",nom_territoire,"_centroid.csv")
