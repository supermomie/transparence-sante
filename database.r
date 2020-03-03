library(plotly)
library(dplyr)
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)


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

fig <- plot_ly(numbers_convention, labels = ~entreprise_identifiant, values = ~conventions_numbers, type = 'bar')
fig <- fig %>% layout(title = 'Pie de toutes les conventions selon chaques entreprise',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      htmlH1('Hello Dash'),
      htmlDiv(children = "Dash: A web application framework for R."),
      dccGraph(
        figure=list(
          data=list(
            list(
              x=avantages_by_categories_remunaration$benef_categorie_code,
              y=avantages_by_categories_remunaration$cat,
              type='bar',
              name='nombre total de personnes'
            ),
            list(
              x=avantages_by_categories_avantage$benef_categorie_code,
              y=avantages_by_categories_avantage$cat,
              type='bar',
              name='avantages_by_categories_avantage'
            )
          ),
          layout = list(title='categories avantages')
        )
      ),
      dccGraph(
        figure=list(
          data=list(
            list(
              x=object_convention$conv_objet,
              y=object_convention$objects_conventions,
              type='bar',
              name='object_convention'
            )
          ),
          layout = list(title='nombre object convention')
        )
      ),
      dccGraph(
        figure=fig
      )
    )
  )
)
app$run_server()
