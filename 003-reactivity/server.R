library(shiny)
library(datasets)
library(raster)
library(rgdal)
library(leaflet)
library(maptools)
library(png)
library(jpeg)
library(ncdf)   
library(rasterVis)
library(sp)

# Define server logic required to summarize and view the selected
# dataset


shinyServer(function(input, output) {
    setwd("/nethome/erichs/counties/")
    counties <- readShapePoly('UScounties.shp', 
                            proj4string=CRS
                            ("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
    projection = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")
    WA <- counties[grep("Washington", counties@data$STATE_NAME),]
  
  output$plot <- renderPlot({ 
    setwd("/reacchspace/dmine/agmesh-scenarios/scenario_52177/raster_commodity/")
    r <- raster(paste(input$year, ".", input$month, ".", input$commodity, "_raster.grd", sep=""))  
    
    #r <- raster(rpre)
    
    rgb.palette <- colorRampPalette(c("blue", "green"))
    levelplot(r, att='ACRES', colorkey=TRUE, col.regions=rgb.palette(120)) + layer(sp.polygons(WA))
    #levelplot(r, att='ACRES', colorkey=TRUE, col.regions=rgb.palette(120))
  })

})
