shinyUI(
  pageWithSidebar(
   
    headerPanel("Prediction of CO2 emissions from waste and impact of recycling"),
   
   sidebarPanel(
     
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
     tabsetPanel(
       tabPanel("Results", verbatimTextOutput("Results"),
                
                h3('Estimated emissions based on household and recycling habits'),
                h4('Pounds of CO2 per year estimated'),
                verbatimTextOutput("prediction"),
                
                h3('Based on entered values'),
                h4('Number of people in your household:'),
                verbatimTextOutput("oid1")
                #h4('Materials and items recycled:'),
                #verbatimTextOutput("orec")
                
                ),
       tabPanel("Documentation", verbatimTextOutput("Documentation"),
                h3(' '),
                h5('The app here developed allows you to easily calculate the CO2 emissions equivalent from waste production per year, at the net of recycling habits. This is based on a part of the EPA model for calculation of individual emissions.'),
                h3(' '),
                h5('Available inputs:'),
                h5('- enter the number of people in the household, which is a base for the estimation of emissions'),
                h5('- check the boxes corresponding to what is usually being recycled in the household'),
                h3(' '),
                h6('Based on EPA Inventory of U.S. Greenhouse Gas Emissions and Sinks 1990-2011,Chapter 8 (Waste), Table 8-3 and Chapter 3, Table 3-1, and EPA annual Municipal Solid Waste Characterization Report: Facts and Figures, 2011.')
              
                )
     )
   )
   

  )
)