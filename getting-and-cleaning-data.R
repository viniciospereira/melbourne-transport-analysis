###########################################################################
# Getting and cleaning the data to analyse Melbourne transport            #
# Author: Vinicios Pereira                                                #
###########################################################################

# Loading libraries.

# Tests if pacman package is installed. If not installs and loads it.
if(!library(pacman, logical.return = TRUE)){
  install.packages("pacman")
  library(pacman)
}

p_load(data.table)

# Define the data relative path.
scanOnFolder0 <- 'data/Samp_0/ScanOnTransaction'
scanOffFolder0 <- 'data/Samp_0/ScanOffTransaction'
scanOnFolder1 <- 'data/Samp_1/ScanOnTransaction'
scanOffFolder1 <- 'data/Samp_1/ScanOffTransaction'

# Get the list of all data files.
onFiles0 <- list.files(scanOnFolder0, recursive = TRUE,full.names = TRUE)
offFiles0 <- list.files(scanOffFolder0, recursive = TRUE, full.names = TRUE)
onFiles1 <- list.files(scanOnFolder1, recursive = TRUE,full.names = TRUE)
offFiles1 <- list.files(scanOffFolder1, recursive = TRUE, full.names = TRUE)

# Read all files in onFiles0.
allOn <- data.frame()
countFiles <- 0
for (fileOn in onFiles0){
  cmd <- paste0("gzip -dc ", fileOn)
  dt <- fread(cmd, sep = "|")
  
  allOn <- rbind(allOn, dt)
  
  countFiles <- countFiles + 1
  cat(countFiles, ' of ', length(onFiles0), '\n')
}
