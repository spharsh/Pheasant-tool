library(dplyr)
library(raster)
library(leaflet)
library(rgdal)

tw <- shapefile("C:/users/sprih.harsh/Desktop/R/Pheasant/township/37_35_25_17_15_05_03.shp")
twnshp<-readOGR("C:/users/sprih.harsh/Desktop/R/Pheasant/township","37_35_25_17_15_05_03")
head(twnshp@data,3)
plot(twnshp)
print(proj4string(twnshp))
twnshp = spTransform(twnshp, CRS("+proj=longlat +datum=WGS84 +no_defs"))
print(proj4string(twnshp))
#bd1<-leaflet(data=twnshp)%>%addTiles()%>%addPolylines(fill=FALSE)
#bd1

fl_wfp <- shapefile("C:/users/sprih.harsh/Desktop/R/Pheasant/clipped/FL_WFP_township.shp")
fl_wfp_twnshp<-readOGR("C:/users/sprih.harsh/Desktop/R/Pheasant/clipped","FL_WFP_township")
head(fl_wfp_twnshp@data,3)
plot(fl_wfp_twnshp)
fl_wfp_twnshp = spTransform(fl_wfp_twnshp, CRS("+proj=longlat +datum=WGS84 +no_defs"))
print(proj4string(fl_wfp_twnshp))


gpa <- shapefile("C:/users/sprih.harsh/Desktop/R/Pheasant/clipped/GPA_township.shp")
gpa_twnshp<-readOGR("C:/users/sprih.harsh/Desktop/R/Pheasant/clipped","GPA_township")
head(gpa_twnshp@data,3)
plot(gpa_twnshp)
print(proj4string(gpa_twnshp))
gpa_twnshp = spTransform(gpa_twnshp, CRS("+proj=longlat +datum=WGS84 +no_defs"))
print(proj4string(gpa_twnshp))


route <- shapefile("C:/users/sprih.harsh/Desktop/R/Pheasant/route_buff.shp")
route_twnshp<-readOGR("C:/users/sprih.harsh/Desktop/R/Pheasant","route_buff")
head(route_twnshp@data,3)
plot(route_twnshp)

print(proj4string(route_twnshp))
route_twnshp = spTransform(route_twnshp, CRS("+proj=longlat +datum=WGS84 +no_defs"))

print(proj4string(route_twnshp))


soil <- shapefile("C:/users/sprih.harsh/Desktop/R/Pheasant/clipped/soil_twn.shp")
soil_twnshp<-readOGR("C:/users/sprih.harsh/Desktop/R/Pheasant/clipped","soil_twn")
head(soil_twnshp@data,3)
plot(soil_twnshp)
print("abc2")
print(proj4string(soil_twnshp))
soil_twnshp = spTransform(soil_twnshp, CRS("+proj=longlat +datum=WGS84 +no_defs"))
print("abc")
print(proj4string(soil_twnshp))
print("abc3")