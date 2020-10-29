root <- paste0(normalizePath("~"),"/")
rootdir    <- paste0(normalizePath("~"),"/emd_rdc/")

scriptdir  <- paste0(rootdir,"scripts/")
script_conc_dir <- paste0(rootdir,"scripts/scripts_concessions/")

data_dir   <- paste0(rootdir,"data/")
gld_dir    <- paste0(data_dir,"glad/")
adm_dir    <- paste0(data_dir,"admin/")
tmp_dir    <- paste0(data_dir,"tmp/")
fnf_dir    <- paste0(data_dir,"fmask/")
emd_dir    <- paste0(data_dir,"emd/")
stt_dir    <- paste0(data_dir,"stats/")
cna_dir    <- paste0(data_dir,"conc_agr/")
cnf_dir    <- paste0(data_dir,"conc_for/")
cnm_dir    <- paste0(data_dir,"conc_min/")

dir.create(data_dir,showWarnings = F)
dir.create(gld_dir ,showWarnings = F)
dir.create(adm_dir ,showWarnings = F)
dir.create(tmp_dir ,showWarnings = F)
dir.create(fnf_dir ,showWarnings = F)
dir.create(emd_dir ,showWarnings = F)
dir.create(stt_dir ,showWarnings = F)
dir.create(cna_dir ,showWarnings = F)
dir.create(cnf_dir ,showWarnings = F)
dir.create(cnm_dir ,showWarnings = F)

################### INITIALIZE PARAMETERS
source(paste0(scriptdir,"packages.R"))
source(paste0(rootdir,"module_EMD/param_concessions.R"))




