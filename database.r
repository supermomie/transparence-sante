path = paste(getwd(),"/Documents/microsoft/R/transparance_sante/", sep="")
source(paste(path, "src/cleaning.r", sep=""))

file_avantage <- paste(path, "bases/declaration_avantage_2020_02_19_04_00.csv", sep="")
data_avantage <- read.table(file_avantage, header = TRUE, sep = ";", quote = "\"",dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_avantage <- data.frame(data_avantage)
data_avantage
data_avantage_set_splited <- splitdb(data_avantage, 0.25)
#data_avantage_set_splited <- clean(data_avantage)
#data_avantage


file_convention <- paste(path, "bases/declaration_convention_2020_02_19_04_00.csv", sep="")
data_convention <- read.table(file_convention, header = TRUE, sep = ";", quote = "\"",
                            dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_convention <- data.frame(data_convention)
data_convention <- splitdb(data_convention, 0.25)
data_convention


file_remuneration <- paste(path, "bases/declaration_remuneration_2020_02_19_04_00.csv", sep="")
data_remuneration <- read.table(file_remuneration, header = TRUE, sep = ";", quote = "\"",
                              dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_remuneration <- data.frame(data_remuneration)
data_remuneration <- splitdb(data_remuneration, 0.25)
data_remuneration

file_entreprise <- paste(path, "bases/entreprise_2020_02_19_04_00.csv", sep="")
data_entreprise <- read.table(file_entreprise, header = TRUE, sep = ",", quote = "\"",
                                dec = ",", fill = TRUE, comment.char = "", encoding = "utf-8")
data_entreprise <- data.frame(data_entreprise)
data_entreprise <- splitdb(data_entreprise, 0.25)
data_entreprise
