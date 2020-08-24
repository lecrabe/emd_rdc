####################################################################################
#######          POST-PROCESS ALERTES GLAD > EMD                ####################
#######          FAO Open Foris SEPAL project                   ####################
#######          Contact: remi.dannunzio@fao.org                ####################
#######          Last update: 2020/08/20                        ####################
####################################################################################

####################################################################################
###### CONFIGURATION
####################################################################################
source(paste0(paste0(normalizePath("~"),"/emd_rdc/scripts/"),"config.R"))

####################################################################################
###### SELECTION PARAMETRES : MODIFIER parameters.R
####################################################################################


for(nom_territoire in list_territoires[]){
  ####################################################################################
  ###### PROCESSUS
  ####################################################################################
  source(paste0(scriptdir,"variables.R"))
  
  source(paste0(scriptdir,"buffer_zones.R"))
  source(paste0(scriptdir,"align_inputs.R"))
  source(paste0(scriptdir,"compute_size.R"))
  source(paste0(scriptdir,"criteres_emd.R"))
  source(paste0(scriptdir,"emd_ras_vect.R"))
}

source(paste0(scriptdir,"visualize.R"))



####################################################################################
# FAO declines all responsibility for errors or deficiencies in the database or
# software or in the documentation accompanying it, for program maintenance and
# upgrading as well as for any damage that may arise from them. FAO also declines
# any responsibility for updating the data and assumes no responsibility for errors
# and omissions in the data provided. Users are, however, kindly asked to report any
# errors or deficiencies in this product to FAO.
####################################################################################