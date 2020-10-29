################### GRAB BASE DATE NAME
base_date      <- substr(basename(alert_file),1,nchar(basename(alert_file))-9)

conc_agr_geo_outname  <- paste0(emd_dir,base_date,"_attr_agr.csv")
conc_for_geo_outname  <- paste0(emd_dir,base_date,"_attr_for.csv")
conc_min_geo_outname  <- paste0(emd_dir,base_date,"_attr_min.csv")
zone_int_geo_outname  <- paste0(emd_dir,base_date,"_attr_zin.csv")


################### DEFINE ALL VARIABLES
glad_clump     <- paste0(dirname(alert_file),"/",base_date,"_clump.tif")
glad_date_file <- paste0(dirname(alert_file),"/",base_date,"_glad_date.tif")
glad_stt_file  <- paste0(dirname(alert_file),"/",base_date,"_stats.txt")

date_stt_file  <- paste0(gld_dir,base_date,"_stat_date.txt")


glad_msk_file  <- alert_file
glad_date_bb   <- glad_date_file  

glad_rcl_file  <- paste0(gld_dir,base_date,"_recl.txt") 
glad_report    <- paste0(stt_dir,base_date,"_report.txt")


emd_rcl_tmp    <- paste0(tmp_dir,"tmp_emd.tif")
emd_conf_tmp   <- paste0(tmp_dir,"tmp_emd_conf.shp")
emd_potl_tmp   <- paste0(tmp_dir,"tmp_emd_potl.shp")

emd_file_tif   <- paste0(emd_dir,base_date,"_emd.tif") 
emd_file_shp   <- paste0(emd_dir,base_date,"_emd.shp")

emd_point_shp   <- paste0(emd_dir,base_date,"_centroid.shp")
emd_point_csv   <- paste0(emd_dir,base_date,"_centroid.csv")
