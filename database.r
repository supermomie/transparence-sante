library(dplyr)

file_avantage <- "/home/fakhredine/Documents/microsoft/R/brief/Group_project/bases/declaration_avantage_2020_02_19_04_00.csv"
data_avantage <- read.table(file_avantage, header = TRUE, sep = ";", quote = "\"",dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_avantage



file_convention <- '/home/fakhredine/Documents/microsoft/R/brief/Group_project/bases/declaration_convention_2020_02_19_04_00.csv'
data_convention <- read.table(file_convention, header = TRUE, sep = ";", quote = "\"",
                            dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_convention <- data.frame(data_convention)



file_remuneration <- '/home/fakhredine/Documents/microsoft/R/brief/Group_project/bases/declaration_remuneration_2020_02_19_04_00.csv'
data_remuneration <- read.table(file_remuneration, header = TRUE, sep = ";", quote = "\"",
                              dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_remuneration <- data.frame(data_remuneration)


file_entreprise <- '/home/fakhredine/Documents/microsoft/R/brief/Group_project/bases/entreprise_2020_02_19_04_00.csv'
data_entreprise <- read.table(file_entreprise, header = TRUE, sep = ",", quote = "\"",
                                dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_entreprise <- data.frame(data_entreprise)


data_avantage
data_convention
data_remuneration
data_entreprise



#COUNT NUMBER TIME WHEN CIE HAS CALLED
num_time_entreprise_conv <- data_convention %>% 
  group_by(entreprise_identifiant) %>%
  summarise("nb" = n())
max(num_time_entreprise_conv)


#COUNT TOTAL TTC FOR EACH CIE
ttc_entreprise_conv <- data_convention %>%
  group_by(entreprise_identifiant) %>%
  count(entreprise_identifiant)
ttc_entreprise_conv





conv <- data_convention %>% 
  mutate(id = row_number())
conv

query <- data_remuneration %>% select(entreprise_identifiant, everything())
#query <- select(data_remuneration, entreprise_identifiant, everything())

query %>% 
  inner_join(
    data_convention %>% 
      mutate(id = row_number()), 
    data_remuneration %>% 
      mutate(id = row_number()), 
    by=c("entreprise_identifiant", "entreprise_identifiant")
    )

query
#join <- inner_join(data_remuneration, data_convention, by=c("entreprise_identifiant", "entreprise_identifiant"))
#join