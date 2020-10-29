#############################################################
proj_alert <- proj4string(raster(alert_file))

conc_agr  <- readOGR(conc_agr_file)
conc_for  <- readOGR(conc_for_file)
conc_min  <- readOGR(conc_min_file)
zone_int  <- readOGR(zone_int_file)

conc_agr@data$id_agr <- row(conc_agr@data)[,1]
conc_for@data$id_for <- row(conc_for@data)[,1]
conc_min@data$id_min <- row(conc_min@data)[,1]
zone_int@data$id_zin <- row(zone_int@data)[,1]

conc_agr_geo <- spTransform(conc_agr,proj_alert)
conc_for_geo <- spTransform(conc_for,proj_alert)
conc_min_geo <- spTransform(conc_min,proj_alert)
zone_int_geo <- spTransform(zone_int,proj_alert)

write.csv2(conc_agr_geo,conc_agr_geo_outname,row.names = F)
write.csv2(conc_for_geo,conc_for_geo_outname,row.names = F)
write.csv2(conc_min_geo,conc_min_geo_outname,row.names = F)
write.csv2(zone_int_geo,zone_int_geo_outname,row.names = F)
