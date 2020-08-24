#############################################################
list.files(paste0(root,"glad_results/"),pattern = "date.tif",recursive = T)

### INPUT NAMES
alert_file  <- paste0(root,"glad_results/CG/CG_2017-03-01_2017-08-21_glad.tif")

fmask_file  <- paste0(fnf_dir,"results_rdc_map_2016_2018.tif")

point_file  <- paste0(adm_dir,"chef_lieu_emd_pilote.shp")

#zones_file  <- paste0(adm_dir,"Territoire_pilote_mercator.shp")
zones_file  <- paste0(adm_dir,"GADM_COD.shp")


### PARAMETRES
buffer_size <- 100 # EN KM
emd_size    <- 55  # EN PIXELS

#zone_field  <- "NOM"
#list_territoires <- c("Inongo","Masi-Manimba","Bomongo","Budjala","Bumba")

zone_field       <- "GID_0"
list_territoires <- c("COD")
nom_territoire   <- list_territoires[1]
