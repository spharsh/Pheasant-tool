library(shiny)
library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(raster)
library(leaflet)
library(rgdal)


set.seed(10)


shinyServer(function(input, output, session) {

  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
   
    output$mymap <- renderLeaflet({
    township<-shapefile("C:/Users/sprih.harsh/Desktop/R/Pheasant/township/37_35_25_17_15_05_03.shp")
   
    #fl_wfp<-shapefile("C:/Users/sprih.harsh/Desktop/R/Pheasant/clipped/FL_WFP_township.shp")
    leaflet() %>% addTiles() %>% addPolygons(data=twnshp, fill = TRUE, stroke = FALSE, color = "#F5F5DC", fillOpacity = 0.2, group = "Study area") %>% addPolygons(data=soil_twnshp, fill = TRUE, stroke = FALSE, color = "#CD661D", fillOpacity = 0.5, group = "Study area") %>% addPolygons(data=fl_wfp_twnshp,fill = TRUE, stroke = TRUE, color = "#0000FF")%>% addPolygons(data=gpa_twnshp,fill = TRUE, stroke = TRUE, color = "#006400")%>% addPolylines(data=route_twnshp,fill = TRUE, stroke = TRUE, color = "#BB7355",fillOpacity=0.4)
    #leaflet(bd1) %>% addTiles() %>% addPolylines(fill = TRUE, stroke = TRUE, color = "#03F", group = "Study area") 
    })
    
    output$contents <- renderTable({
      
      # input$file1 will be NULL initially. After the user selects
      # and uploads a file, it will be a data frame with 'name',
      # 'size', 'type', and 'datapath' columns. The 'datapath'
      # column will contain the local filenames where the data can
      # be found.
      
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      read.csv(inFile$datapath, header=input$header, sep=input$sep, 
               quote=input$quote)
    })
    
    output$downloadData <- downloadHandler(
      filename = function() { 
        paste(input$dataset, '.csv', sep='') 
      },
      content = function(file) {
        write.csv(datasetInput(), file)
      }
    )
    
    score <- matrix(c(5.5,4.3,5.6,6.7,6.5),ncol=5,byrow=TRUE)
    colnames(score) <- c("Undisturbed Grassland","Foodplot","Winter Cover","Small Grains", "Final Score")
    rownames(score) <- c("Score")
    score <- as.table(score)
    
    
    output$table <- renderTable({
      
      input$runButton
      
      if (input$runButton == 0) {return()}        
      else{
        score
      }
    })
    
    output$summary <- renderPrint({
      HTML(
        '<p style="text-align:justify">This R Shiny web application presents scoring and recommendation for managing pheasant habitat in townships of South Dakota,USA.
        The scores are calculated on basis of values of certain parameters essential for survival of pheasant like percentage of grassland, cropland, winter crop, shelterbelts etc.</p>
        <p style="text-align:justify">Recommendations are also available. Depending on the score and situation of a township, different recommendations has been provided for a better management of habitat.
        <a href="https://uasnap.shinyapps.io/cc4liteFinal/">Recommendations in township R app</a>.</p>
        
        <h4>Additional Features</h4>
        <ul>
        <li>% of grassland.</li>
        <li>Upload a custom shapefile to mask map layer in a the upload window.</li>
        <li>Visually confirm your original shapefile and reprojected (if applicable) shapefile on the map look right.</li>
        <li>The uploader compares your shapefile with the app data to ensure validity.</li>
        <li>Shapefiles may contain points, lines, or polygons.</li>
        <li>Combine crop and mask operations.</li>
        <li>Use the color swatches to select from common color palettes or create your own.</li>
        <li>Download the displayed map as a geotiff.</li>
        <li>Disable tooltips if you don\'t need them.</li>
        </ul>
        '
      )
    })
    
    

})

