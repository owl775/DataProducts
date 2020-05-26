# get numeric variables from College dataset
library(ISLR)
data(College)
col_names <- colnames(College)
#remove "Private" factor variable
valid_variables <- col_names[-1]

shinyUI(
  pageWithSidebar(
  headerPanel('Introduction to Statistical Learning College Dataset k-means Clustering'),
  sidebarPanel(
    selectInput('x_var', 'Select Variable 1', valid_variables),
    selectInput('y_var', 'Select Variable 2', valid_variables, selected = valid_variables[[2]]),
    numericInput('num_clusters', 'Number of Clusters', 4, min = 1, max = 12)
  ),
  mainPanel(
    h3('Results of k-means clustering'),
    plotOutput('plot1')
    )
  )
)

