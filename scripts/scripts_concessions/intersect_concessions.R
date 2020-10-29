centroid <- readOGR(emd_point_shp)

centroid$id_agr <- over(centroid,conc_agr_geo)[,"id_agr"]
centroid$id_for <- over(centroid,conc_for_geo)[,"id_for"]
centroid$id_min <- over(centroid,conc_min_geo)[,"id_min"]
centroid$id_zin <- over(centroid,zone_int_geo)[,"id_zin"]

out <- centroid[!is.na(centroid@data$size),]

head(out)
summary(out@data)

writeOGR(out,emd_point_shp,substr(basename(emd_point_shp),1,nchar(basename(emd_point_shp))-4),"ESRI Shapefile",overwrite_layer = T)
