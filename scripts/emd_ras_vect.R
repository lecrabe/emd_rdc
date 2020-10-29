if(!file.exists(emd_point_csv)){
  
  #############################################################
  ####################  RECLASSER GLAD EN EMD
  #############################################################
  system(sprintf("(echo %s; echo 2; echo 1; echo 2; echo 3;echo 0) | oft-reclass -oi  %s %s",
                 glad_rcl_file,
                 emd_rcl_tmp,
                 glad_clump))
  
  
  #############################################################
  ####################  CONVERT RESULTS TO BYTE
  #############################################################
  system(sprintf("gdal_translate -co COMPRESS=LZW %s %s",
                 emd_rcl_tmp,
                 emd_file_tif 
  ))
  
  
  #############################################################
  ####################  POLYGONISER LES EMD CONFIRMES
  #############################################################
  system(sprintf("rm -r -f %s",emd_conf_tmp))
  
  system(sprintf("gdal_polygonize.py -8 -b 1 -f \"ESRI Shapefile\" %s %s",
                 emd_file_tif,
                 emd_conf_tmp 
  ))
  
  #############################################################
  ####################  POLYGONISER LES EMD POTENTIELS
  #############################################################
  system(sprintf("rm -r -f %s",emd_potl_tmp))
  
  system(sprintf("gdal_polygonize.py -8 -b 2 -f \"ESRI Shapefile\" %s %s",
                 emd_file_tif,
                 emd_potl_tmp 
  ))
  
  #############################################################
  ####################  LIRE EN SHAPEFILE ET AJOUTER STATUT
  #############################################################
  emd_shp_conf  <- readOGR(emd_conf_tmp)
  emd_shp_potl  <- readOGR(emd_potl_tmp)
  
  emd_shp_conf@data$status <- 3
  emd_shp_potl@data$status <- 2
  
  #############################################################
  ####################  CREER LES CENTROIDES
  #############################################################
  c1 <- SpatialPointsDataFrame(gCentroid(emd_shp_conf,byid=T),
                               emd_shp_conf@data)
  
  c2 <- SpatialPointsDataFrame(gCentroid(emd_shp_potl,byid=T),
                               emd_shp_potl@data)
  
  centroid    <- union(c1,c2)
  dbf         <- centroid@data
  dbf$sort_id <- row(dbf)[,1]
  
  #############################################################
  ####################  FUSIONNER METADONNEES ALERTES
  #############################################################
  df            <- read.table(glad_rcl_file)
  names(df)     <- c("id","id_conf","id_potl","size")
  
  dates         <- read.table(date_stt_file)
  names(dates)  <- c("id","size_dates","mean_jday","sd_jday")
  
  summary(dates)
  
  d0            <- merge(dbf,df,by.x="DN",by.y="id",all.x=T)
  d1            <- merge(d0,dates,by.x="DN",by.y="id",all.x=T)
  
  centroid@data <- arrange(d1,sort_id)
  
  
  ####################  EXPORTER EN SHAPEFILE ET EN CSV
  #############################################################
  out        <- centroid[!is.na(centroid@data$id_conf),]
  writeOGR(out,emd_point_shp,substr(basename(emd_point_shp),1,nchar(basename(emd_point_shp))-4),"ESRI Shapefile",overwrite_layer = T)
  
  tryCatch({
    out_geo    <- spTransform(out,CRS('+init=EPSG:4326'))
    out_csv    <- cbind(out_geo@data,out_geo@coords)[,c("DN","x","y","status","size","size_dates","mean_jday","sd_jday")]
    
    write.csv(out_csv,emd_point_csv,row.names = F)
  }, error = function(e) {
    cat(paste0("Nombre d'alertes selectionnées : ",nrow(selection)))
  })
  
  
  
}