if(!file.exists(glad_msk_file)){
  

#############################################################
################### GET BOUNDING BOX
#############################################################
bb <- extent(aoi_geo)


#############################################################
################### CLIP ALERTS TO BOUNDING BOX
#############################################################
system(sprintf("gdal_translate -ot Byte -projwin %s %s %s %s -co COMPRESS=LZW %s %s",
               floor(bb@xmin),
               ceiling(bb@ymax),
               ceiling(bb@xmax),
               floor(bb@ymin),
               alert_file,
               glad_bb_file
))


#############################################################
################### CLIP ALERT DATE TO BOUNDING BOX
#############################################################
system(sprintf("gdal_translate -ot Byte -projwin %s %s %s %s -co COMPRESS=LZW %s %s",
               floor(bb@xmin),
               ceiling(bb@ymax),
               ceiling(bb@xmax),
               floor(bb@ymin),
               glad_date_file,
               glad_date_bb
))


#############################################################
#################### ADMIN BOUNDING BOX AS ALIGNMENT GRID
#############################################################
mask   <- glad_bb_file
proj   <- proj4string(raster(mask))
extent <- extent(raster(mask))
res    <- res(raster(mask))[1]


#############################################################
#################### ALIGN FOREST/NON-FOREST MASK
#############################################################
input  <- fmask_file
ouput  <- fterr_file

system(sprintf("gdalwarp -co COMPRESS=LZW -t_srs \"%s\" -te %s %s %s %s -tr %s %s %s %s -overwrite",
               proj4string(raster(mask)),
               extent(raster(mask))@xmin,
               extent(raster(mask))@ymin,
               extent(raster(mask))@xmax,
               extent(raster(mask))@ymax,
               res(raster(mask))[1],
               res(raster(mask))[2],
               input,
               ouput
))


#############################################################
#################### ALIGN ADMIN BOUNDARIES ON RASTER GRID
#############################################################
system(sprintf("oft-rasterize_attr.py -v %s -i %s -o %s -a %s",
               admin_shp,
               glad_bb_file,
               admin_tif,
               "mask"
))

#############################################################
#################### ALIGN BUFFER OF CENTER POINTS ON RASTER GRID
#############################################################
system(sprintf("oft-rasterize_attr.py -v %s -i %s -o %s -a %s",
               buff_shp,
               glad_bb_file,
               buff_tif,
               "mask"
))


#############################################################
#################### COMBINE ALL INPUTS
#############################################################
system(sprintf("gdal_calc.py -A %s -B %s -C %s -D %s --co COMPRESS=LZW --overwrite --outfile=%s --calc=\"%s\"",
               glad_bb_file,
               admin_tif,
               buff_tif,
               fterr_file,
               glad_msk_file,
               paste0("A*(B==1)*(C==1)*(D==2)")
))
}