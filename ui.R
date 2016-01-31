shinyUI(
  pageWithSidebar(
   
    headerPanel("Prediction of CO2 emissions from waste and impact of recycling"),
   
   sidebarPanel(
     h5('The app here developed allows you to easily calculate the CO2 emissions equivalent from waste production per year, at the net of recycling habits. This is based on a part of the EPA model for calculation of individual emissions.'),
      numericInput('id1', 'Number of people in your household', 1, min = 1, max = 10, step = 1),  
      h4("Which products do you recycle?"),
      checkboxInput("rec1", "aluminum and steel cans", value = FALSE),
      checkboxInput("rec2", "plastic", value = FALSE),
      checkboxInput("rec3", "glass", value = FALSE),
      checkboxInput("rec4", "newspaper", value = FALSE),
      checkboxInput("rec5", "magazines", value = FALSE),
       submitButton('Submit')
    ),
   
    mainPanel(
      h3('Estimated emissions based on household and recycling habits'),
      h4('Pounds of CO2 per year estimated'),
      verbatimTextOutput("prediction"),
      
      h3('Based on entered values'),
      h4('Number of people in your household:'),
      verbatimTextOutput("oid1")
      #h4('Materials and items recycled:'),
      #verbatimTextOutput("orec")
    )
  )
)