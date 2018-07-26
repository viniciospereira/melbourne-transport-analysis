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

p_load(googledrive)

# Downloading the data.

# Checks if data direcotry exists, if not creates it.
if(!file.exists("./data")){dir.create("./data")}

# Assigns the URL of the collection data to a variable.
dataUrl <- "https://drive.google.com/open?id=1kJYcsqCwU2TSXGDC2UkfCaSmi9opArwW"
# Downloads the data to data dorectory.


download.file(dataUrl, "./data/getdata-projectfiles-UCI-HAR-Dataset.zip", method = "curl")
# Store the date when the file was downloaded.
dateDownloaded <- date()