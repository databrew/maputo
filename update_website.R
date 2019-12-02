library(tidyverse)
library(yaml)
library(beepr)

# Read in credentials
creds <- yaml.load_file('credentials.yaml')
# Turn into table
creds <- tibble(name = names(creds),
                password = as.character(unlist(creds)))

# # Test to see if connceted to internet
# havingIP <- function() {
#   if (.Platform$OS.type == "windows") {
#     ipmessage <- system("ipconfig", intern = TRUE)
#   } else {
#     ipmessage <- system("ifconfig", intern = TRUE)
#   }
#   validIP <- "((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)[.]){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
#   any(grep(validIP, ipmessage))
# }
# connected <- havingIP()
# 
# if(connected){
  ok <- FALSE

    # Push to git
    system('git add slides/parent.html')
    system("git commit -m 'course update'")
    system(paste0("git push https://'",
                  creds$password[creds$name == 'github_user'],
                  "':'",
                  creds$password[creds$name == 'github_pass'], "'@github.com/databrew/maputo.git"))
    setwd('../databrew.github.io/')
    file.copy(from = '../maputo/slides/parent.html',
              to = 'maputo.html')
    system('git add maputo.html')
    system("git commit -m 'course update'")
    system(paste0("git push https://'",
                  creds$password[creds$name == 'github_user'],
                  "':'",
                  creds$password[creds$name == 'github_pass'], "'@github.com/databrew/databrew.github.io.git"))
    beep(1)
  # }
# }
