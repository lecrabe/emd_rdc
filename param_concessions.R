####################################################################################
list.files(paste0(root,"glad_results/"),pattern = "date.tif",recursive = T)

### INPUT NAMES ALERTES
alert_file     <- paste0(root,"glad_results/CG/CG_2020-03-01_2020-08-21_glad.tif")

### INPUT NAMES CONCESSIONS
conc_agr_file  <- paste0(cna_dir,"concessions_agricoles_20201017.shp")
conc_for_file  <- paste0(cnf_dir,"ccf.shp")
conc_min_file  <- paste0(cnm_dir,"permis_miniers_20201017.shp")
zone_int_file  <- paste0(cnm_dir,"zones_interdites.shp")

### PARAMETRES
emd_size       <- 55  # EN PIXELS

