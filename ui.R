source("about.R", local=T)
library(shiny)
library(raster)
library(leaflet)
library(ggplot2)

shinyUI(navbarPage("Township Score", id="nav",
                         
           tabPanel("Township",div(class="outer",
              tags$head(
              # Include our custom CSS
              includeCSS("C:/Users/sprih.harsh/Desktop/R/Pheasant/styles.css"),
              includeScript("C:/Users/sprih.harsh/Desktop/R/Pheasant/gomap1.js")
                        ),
                                                 
              leafletOutput("mymap", width="100%", height="100%"),
              absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
              width = 330, height = 600,h2("Parameters"),
              sliderInput("bins","Range:",min = 10,max = 100,value = 30),
              selectInput("radio", label = h3("Variables"),
                           choices = list("None"=1, "Aurora" = 2, "Beadle" = 3, "Brookings" = 4,"Codington"=5,"Clark"=6,"Brown"=7,"Clay"=8,"Campbell"=9,"Day"=10), 
                           selected = 1),
              selectInput("dataset", "Choose a dataset:", 
                          choices = c("None","undulating", "flat", "riverine","rugged"),selected="None")
              
                                                              
                         )
   )),
               tabPanel("Township Details and Score",
                  sidebarLayout(
                    sidebarPanel(
                      textInput("text_input_township", "Enter township name"),
                      actionButton("runButton", "Result")
                                    ),
                                    mainPanel(
                                      tabsetPanel(type = "tabs", 
                                                  #tabPanel("Plot", plotOutput("plot")), 
                                                  
                                                  tabPanel("Table", tableOutput("table")),
                                                  tabPanel("Recommendations", verbatimTextOutput("summary"))
                                      )
                                      
                                    )
                                    
                                    
                                    
                                  )
                         ),
   
   
                tabPanel("Upload foodplots",
                         sidebarLayout(
                           sidebarPanel(
                             fileInput('file1', 'Choose CSV File',
                                       accept=c('text/csv', 
                                                'text/comma-separated-values,text/plain', 
                                                '.csv')),
                             tags$hr(),
                             checkboxInput('header', 'Header', TRUE),
                             radioButtons('sep', 'Separator',
                                          c(Comma=',',
                                            Semicolon=';',
                                            Tab='\t'),
                                          ','),
                             radioButtons('quote', 'Quote',
                                          c(None='',
                                            'Double Quote'='"',
                                            'Single Quote'="'"),
                                          '"'),
                             downloadButton('downloadData', 'Download')
                           ),   
                           mainPanel(
                             tableOutput('contents')
                           )
                           
                         
                         )),
   about
               
   ))