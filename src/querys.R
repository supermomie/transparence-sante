library(dplyr)

source("/home/fakhredine/Documents/microsoft/R/transparance_sante/database.R")

# GET TTC des CIE EN FRANCE ===>>>> HIST
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
  summarise("secteurs d'activite en france" = n())

activity_area_france

# b-2) Activity area in All

activity_area <- data_entreprise %>%
  group_by(secteur) %>%
  summarise("secteurs d'activite dans le monde" = n())

activity_area

# c) object convention

object_convention <- data_convention %>%
  group_by(conv_objet) %>%
  summarise("objects_conventions" = n())

object_convention

# d) id convention in all

numbers_convention <- data_convention %>%
  group_by(entreprise_identifiant) %>%
  summarise("conventions_numbers" = n())

numbers_convention
sum(numbers_convention$conventions_numbers)



# 4) Who has most avantage -> bened_cat_code

avantages_by_categories_remunaration <- data_remuneration %>%
  group_by(benef_categorie_code) %>%
  summarise("cat" = n())
avantages_by_categories_remunaration

avantages_by_categories_avantage <- data_avantage %>%
  group_by(benef_categorie_code)%>%
  summarise("cat" = n())
avantages_by_categories_avantage




# scatterplot query

q <- data_convention %>%
  group_by(pays, conv_objet) %>%
  summarise("n" = n())
q

#jointureici
#avantages_by_categories <- avantages_by_categories_remunaration %>% inner_join(avantages_by_categories_avantage, by=)
#avantages_by_categories
#avantages_by_categories_joined



#TODO bisbis get the 390 cie hidden



fig <- plot_ly(numbers_convention, labels = ~entreprise_identifiant, values = ~conventions_numbers, type = 'bar')
fig <- fig %>% layout(title = 'Pie de toutes les conventions selon chaques entreprise',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
#'scatter', 'bar', 'box', 'heatmap', 'histogram', 'histogram2d', 'histogram2dcontour', 'contour', 'scatterternary', 'violin', 
#''funnel', 'waterfall', 'image', 'pie', 'sunburst', 'treemap', 'funnelarea', 'scatter3d', 'surface', 'isosurface', 'volume', 
#''mesh3d', 'cone', 'streamtube', 'scattergeo', 'choropleth', 'scattergl', 'splom', 'pointcloud', 'heatmapgl', 'parcoords', 'parcats',
#' 'scattermapbox', 'choroplethmapbox', 'densitymapbox', 'sankey', 'indicator', 'table', 'carpet', 'scattercarpet', 'contourcarpet', 
#' 'ohlc', 'candlestick', 'scatterpolar', 'scatterpolargl', 'barpolar', 'area'



#Find all firstname, lastname and count how many times there are in the base
all_names <- filter(data_remuneration,pays == "FRANCE", benef_nom != "" , benef_prenom != "", ) %>%
  group_by(benef_nom, benef_prenom) %>%
  summarise('count_each_time_each_person_is_in_db' = n())
#all_names <- all_names %>% data.frame(cbind(all_names$benef_nom, all_names$benef_prenom))
all_names
summary(all_names$count_each_time_each_person_is_in_db)



all_personals <- filter(data_avantage, benef_nom != "", benef_prenom != "") %>%
  group_by(benef_nom, benef_prenom) %>%
  summarise('c' = n())
all_personals


names <- plot_ly(data = all_names, x = ~benef_nom, y = ~count_each_time_each_person_is_in_db)
names

D=data.frame(table(data_remuneration$remu_montant_ttc))
D

#names <- plot_ly(all_names, labels = ~benef_nom, values = ~benef_prenom, type = 'pie')
#names <- names %>% layout(title = 'Pie de toutes les conventions selon chaques entreprise',
#                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
#                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))