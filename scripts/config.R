root <- paste0(normalizePath("~"),"/")
rootdir    <- paste0(normalizePath("~"),"/emd_rdc/")

scriptdir  <- paste0(rootdir,"scripts/")

data_dir   <- paste0(rootdir,"data/")
gld_dir    <- paste0(data_dir,"glad/")
adm_dir    <- paste0(data_dir,"admin/")
tmp_dir    <- paste0(data_dir,"tmp/")
fnf_dir    <- paste0(data_dir,"fmask/")
emd_dir    <- paste0(data_dir,"emd/")
stt_dir    <- paste0(data_dir,"stats/")

dir.create(data_dir,showWarnings = F)
dir.create(gld_dir ,showWarnings = F)
dir.create(adm_dir ,showWarnings = F)
dir.create(tmp_dir ,showWarnings = F)
dir.create(fnf_dir ,showWarnings = F)
dir.create(emd_dir ,showWarnings = F)
dir.create(stt_dir ,showWarnings = F)

################### INITIALIZE PARAMETERS
source(paste0(scriptdir,"packages.R"))
source(paste0(rootdir,"parameters.R"))

print(readOGR(zones_file,verbose = F)@data[,zone_field])




