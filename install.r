install.packages(c("fiery", "routr", "reqres", "htmltools", "base64enc", "plotly", "mime", "crayon", "devtools"))

library(devtools)
# installs dashHtmlComponents, dashCoreComponents, and dashTable
# and will update the component libraries when a new package is released
install_github("plotly/dashR", upgrade = TRUE)

#install.packages("devtools")
