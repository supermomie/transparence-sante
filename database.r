library(dplyr)

file_avantage <- "/home/fakhredine/Documents/microsoft/R/brief/Group_project_3j/bases/declaration_avantage_2020_02_19_04_00.csv"
data_avantage <- read.table(file_avantage, header = TRUE, sep = ";", quote = "\"",dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_avantage <- data.frame(data_avantage)



file_convention <- '/home/fakhredine/Documents/microsoft/R/brief/Group_project_3j/bases/declaration_convention_2020_02_19_04_00.csv'
data_convention <- read.table(file_convention, header = TRUE, sep = ";", quote = "\"",
                            dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_convention <- data.frame(data_convention)



file_remuneration <- '/home/fakhredine/Documents/microsoft/R/brief/Group_project_3j/bases/declaration_remuneration_2020_02_19_04_00.csv'
data_remuneration <- read.table(file_remuneration, header = TRUE, sep = ";", quote = "\"",
                              dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_remuneration <- data.frame(data_remuneration)


file_entreprise <- '/home/fakhredine/Documents/microsoft/R/brief/Group_project_3j/bases/entreprise_2020_02_19_04_00.csv'
data_entreprise <- read.table(file_entreprise, header = TRUE, sep = ",", quote = "\"",
                                dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_entreprise <- data.frame(data_entreprise)





# GET TTC des CIE EN FRANCE
ttc_cie_france <- filter(data_convention, pays == "FRANCE") %>%
  group_by(entreprise_identifiant) %>%
  summarise("investisement de chaque boite" = n())

ttc_cie_france

#3)
# a) Number CIE in FRANCE

total_cie_france <- filter(data_entreprise, pays == "FRANCE") %>%
  group_by(pays) %>%
  summarise("total des cie en france" = n())

total_cie_france

# b) Activity area in France

activity_area_france <- filter(data_entreprise, pays == "FRANCE") %>%
  group_by(secteur) %>%
  summarise("secteurs d'activite" = n())

activity_area_france

# b-2) Activity area in All

activity_area <- data_entreprise %>%
  group_by(secteur) %>%
  summarise("secteurs d'activite" = n())

activity_area

# c) object convention

object_convention <- data_convention %>%
  group_by(conv_objet) %>%
  summarise("objects conventions" = n())

object_convention













#COUNT NUMBER TIME WHEN CIE HAS CALLED 
num_time_entreprise_conv <- data_convention %>% 
  group_by(entreprise_identifiant) %>%
  summarise("TOTALPRICE" = n())
num_time_entreprise_conv$TOTALPRICE


#COUNT TOTAL TTC FOR EACH CIE
ttc_entreprise_conv <- data_convention %>%
  group_by(entreprise_identifiant) %>%
  count(entreprise_identifiant)
ttc_entreprise_conv

len(ttc_entreprise_conv)



#COUNT TOTAL TTC FOR EACH COUNTRY
count_entreprise_conv <- data_entreprise %>%
  group_by(pays) %>%
  summarise("PAYSCODE" = n())

count_entreprise_conv
total_for_each_country <- data.frame(count_entreprise_conv$PAYSCODE)
#total_for_each_country <- names(total_for_each_country)[names(total_for_each_country)] <- "t"
total_for_each_country
percent <- (count_entreprise_conv / total_for_each_country * 100)
percent
#TODO a finir sortir les pays selon les pourcents
sum(count_entreprise_conv$PAYSCODE)


ttc_entreprise_conv <- data_convention %>%
  group_by(entreprise_identifiant) %>%
  count(entreprise_identifiant)
ttc_entreprise_conv











country <- sort(table(data_entreprise$pays),decreasing=TRUE) #renvoie le mode
country




















# COUNT ALL CITYS IN FRANCE's CIE --------DB A CLEAN----------
entrepriseFR<-filter(data_entreprise, pays == "FRANCE") %>%
  group_by(ville) %>%
  #count(ville) %>%
  summarise("nombre_total_de_ville" = n())
entrepriseFR$nombre_total_de_ville