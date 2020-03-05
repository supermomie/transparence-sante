library(plotly)
library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)


source("/home/fakhredine/Documents/microsoft/R/transparance_santedatabase.R")
source("/home/fakhredine/Documents/microsoft/R/transparance_sante/src/querys.R")


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
      htmlH1('Hello Dash'),
      htmlDiv(children = "Dash: A web application framework for R."),
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
      figure=fig
    )
  ),htmlDiv(
    dccGraph(
      figure=names
    )
  )
)
app$run_server()