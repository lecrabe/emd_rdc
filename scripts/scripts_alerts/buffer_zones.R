zones_shp      <- readOGR(zones_file) #spTransform(,CRS('+init=epsg:4326'))
point_shp      <- readOGR(point_file) #spTransform(,CRS('+init=epsg:4326'))

territoire     <- zones_shp[zones_shp@data[,zone_field] == nom_territoire,]
chef_lieu      <- point_shp[territoire,]
buffer         <- gBuffer(chef_lieu,byid=T,width=buffer_size*1000,quadsegs = 25)

buffer$mask     <- 1
territoire$mask <- 1


aoi_geo <- spTransform(territoire,CRS('+init=epsg:4326'))
buf_geo <- spTransform(buffer,CRS('+init=epsg:4326'))

writeOGR(aoi_geo,admin_shp,substr(basename(admin_shp),1,nchar(basename(admin_shp))-4),"ESRI Shapefile",overwrite_layer = T)
writeOGR(buf_geo,buff_shp,substr(basename(buff_shp),1,nchar(basename(buff_shp))-4),"ESRI Shapefile",overwrite_layer = T)


