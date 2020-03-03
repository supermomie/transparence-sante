library(dplyr)

source("/home/fakhredine/Documents/microsoft/R/brief/Group_project_3j/database.R")

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

#jointureici
#avantages_by_categories <- avantages_by_categories_remunaration %>% inner_join(avantages_by_categories_avantage, by=)
#avantages_by_categories
#avantages_by_categories_joined



#TODO bisbis get the 390 cie hidden



USPersonalExpenditure <- data.frame("Categorie"=rownames(USPersonalExpenditure), USPersonalExpenditure)
data <- USPersonalExpenditure[,c('Categorie', 'X1960')]

#'scatter', 'bar', 'box', 'heatmap', 'histogram', 'histogram2d', 'histogram2dcontour', 'contour', 'scatterternary', 'violin', 
#''funnel', 'waterfall', 'image', 'pie', 'sunburst', 'treemap', 'funnelarea', 'scatter3d', 'surface', 'isosurface', 'volume', 
#''mesh3d', 'cone', 'streamtube', 'scattergeo', 'choropleth', 'scattergl', 'splom', 'pointcloud', 'heatmapgl', 'parcoords', 'parcats',
#' 'scattermapbox', 'choroplethmapbox', 'densitymapbox', 'sankey', 'indicator', 'table', 'carpet', 'scattercarpet', 'contourcarpet', 
#' 'ohlc', 'candlestick', 'scatterpolar', 'scatterpolargl', 'barpolar', 'area'