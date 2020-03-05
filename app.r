library(plotly)
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

path = paste(getwd(),"/Documents/microsoft/R/transparance_sante/", sep="")
source(paste(path, "database.r", sep=""))
source(paste(path, "querys.r", sep=""))



external_scripts <- list(
  list('https://www.google-analytics.com/analytics.js'),
  list(src = 'https://cdn.polyfill.io/v2/polyfill.min.js'),
  list(src = 'https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.10/lodash.core.js')
)

external_stylesheets <- list(
  list('https://codepen.io/chriddyp/pen/bWLwgP.css'),
  list(href = 'https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css')
)
app <- Dash$new(
  external_scripts = external_scripts,
  external_stylesheets = external_stylesheets
)

app$layout(
  htmlDiv(
    list(
      htmlH1('KFC'),
      htmlDiv(children = "NOTRE RAPPORT DE LA BASE PAS SI TRANSPARENTE QUE CA"),
      dccGraph(
        figure=list(
          data=list(
            list(
              x=avantages_by_categories_remunaration$benef_categorie_code,
              y=avantages_by_categories_remunaration$cat,
              type='bar',
              name='nombre total de personne ayant des avantages'
            ),
            list(
              x=avantages_by_categories_avantage$benef_categorie_code,
              y=avantages_by_categories_avantage$cat,
              type='bar',
              name='nombre total de personnes'
            )
          ),
          layout = list(title='PERSONNELS ET AVANTAGES')
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
      )
    )
  ),htmlDiv(
    dccGraph(
      figure=fig_all_cie_france
    )
  ),htmlDiv(
    dccGraph(
      figure=names
    )
  ),htmlDiv(
    dccGraph(
      figure=figconvpercent #pie 
    )
  ),htmlDiv(
    dccGraph(
      figure=fig_activity_area_france #secteur d'activite
    )
  )
)
app$run_server()