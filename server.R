# id1 = number of people in household
average_waste_emissions <- 692 # (Pounds of carbon dioxide equivalent/year)
# constant pro capite
metal_recycling_avoided_emissions<-(-89.38)
plastic_recycling_avoided_emissions<-(-35.56)
glass_recycling_avoided_emissions<-(-25.39)
newspaper_recycling_avoided_emissions<-(-113.14)
mag_recycling_avoided_emissions<-(-27.46)


totalWasteEmissions <- function(id1, rec1, rec2, rec3, rec4, rec5) {

  sum_temp<- id1*(average_waste_emissions +
  rec1*metal_recycling_avoided_emissions +
  rec2*plastic_recycling_avoided_emissions +  
  rec3*glass_recycling_avoided_emissions +
  rec4*newspaper_recycling_avoided_emissions +
  rec5*mag_recycling_avoided_emissions)
  
  if(sum_temp>0) sum_temp
  else 0
  
}

shinyServer(
  function(input, output) {
    output$prediction <- renderPrint({totalWasteEmissions(input$id1,input$rec1,input$rec2,input$rec3,input$rec4,input$rec5)})
    output$oid1 <- renderPrint({input$id1}) # household
  #  output$orec <- renderPrint({c((input$rec1)*("a"),(input$rec2)*("v"))}) # materials
        
  }
)