message("Remove special characters")
data$EVTYPE <- gsub("[\001\002]", "", data$EVTYPE)
message("Remove two or more spaces")
data$EVTYPE <- gsub("\\s{2,}", " ", data$EVTYPE, perl=TRUE)
message("Express all events in uppercase")
data$EVTYPE <- toupper(data$EVTYPE)
message("Fix some miss-spellings")
data[ data$EVTYPE == "AVALANCE", "EVTYPE"] <- "AVALANCHE"
data[ data$EVTYPE == "BEACH EROSIN", "EVTYPE"] <- "BEACH EROSION"
data[ data$EVTYPE == "WND", "EVTYPE"] <- "WIND"
data[ data$EVTYPE %in% c('COASTALSTORM'), "EVTYPE" ] <- "COASTAL STORM"
data$EVTYPE <- gsub("MIRCOBURST", "MICROBURST", data$EVTYPE)
message("Uniforming events written in differeny ways")
data[ data$EVTYPE %in% c('WINTER STORM HIGH WINDS', 'WINTER STORM HIGH WINDS'), "EVTYPE" ] <- "WINTER STORM/HIGH WIND"
data[ data$EVTYPE %in% c('FLOOD/FLASH FLOOD', 'FLASH FLOOD/FLOOD', 'FLASH FLOODING/FLOOD', 'FLASH FLOODS', 'FLASH FLOODING'), "EVTYPE" ] <- "FLASH FLOOD"
data[ data$EVTYPE %in% c('FLOOD'), "EVTYPE" ] <- "FLOODING"
data[ data$EVTYPE %in% c('COASTAL FLOODING', 'COASTAL FLOODING/EROSION'), "EVTYPE" ] <- "COASTAL FLOOD"
data[ , "EVTYPE" ] <- gsub("^(HIGH WIND) 48$", "\\1", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(HIGH WIND) AND (SEAS)$", "\\1/\\2", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("(\\W)(WIND|RAIN|WAVE)S$", "\\1\\2", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(LIGHTNING)\\W.*", "\\1", data$EVTYPE, perl=TRUE)
# data[ , "EVTYPE" ] <- gsub("(\\W)RAINS$", "\\1RAIN", data$EVTYPE, perl=TRUE)
# data[ , "EVTYPE" ] <- gsub("(\\W)WAVES$", "\\1WAVE", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(THUNDERSTORMS|THUNDERSTORMW|THUNDERTORM)(.*)$", "THUNDERSTORM\\2", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^TSTM ","THUNDERSTORM ", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(TORNADO)\\W.*","\\1 ", data$EVTYPE, perl=TRUE)
data[ data$EVTYPE %in% c('HEAT WAVE DROUGHT'), "EVTYPE" ] <- "HEAT WAVE"
data[ data$EVTYPE %in% c('RECORD HEAT'), "EVTYPE" ] <- "HEAT"
data[ grepl("^HURRICANE (EDOUARD|EMILY|FELIX|ERIN|OPAL|OPAL/HIGH WIND)$", data$EVTYPE, perl=TRUE), "EVTYPE"] <- "HURRICANE" 
data[ data$EVTYPE %in% c('LANDSLIDES'), "EVTYPE" ] <- "LANDSLIDE"
data[ data$EVTYPE %in% c('MUDSLIDES'), "EVTYPE" ] <- "MUDSLIDE"
data[ data$EVTYPE %in% c('SNOW SQUALLS'), "EVTYPE" ] <- "SNOW SQUALL"
data[ data$EVTYPE %in% c('MARINE TSTM WIND'), "EVTYPE" ] <- "MARINE THUNDERSTORM WIND"
data[ data$EVTYPE %in% c('RIP CURRENTS'), "EVTYPE" ] <- "RIP CURRENT"
data[ data$EVTYPE %in% c('RIVER FLOODING'), "EVTYPE" ] <- "RIVER FLOOD"
data[ data$EVTYPE %in% c('WILD FIRES', 'WILD/FOREST FIRE', 'WILDFIRE'), "EVTYPE" ] <- "WILD FIRE"
data[ data$EVTYPE %in% c('TROPICAL STORM GORDON'), "EVTYPE" ] <- "TROPICAL STORM"
data[ data$EVTYPE %in% c('ICY ROADS', 'ICE ON ROAD'), "EVTYPE" ] <- "ICY ROAD"
data[ data$EVTYPE %in% c('WINTER STORMS'), "EVTYPE" ] <- "WINTER STORM"
data[ data$EVTYPE %in% c('WATERSPOUT TORNADO'), "EVTYPE" ] <- "WATERSPOUT/TORNADO"
data[ data$EVTYPE %in% c('WINTER WEATHER/MIX', 'WINTER WEATHER MIX', 'WINTRY MIX'), "EVTYPE" ] <- "WINTER WEATHER"
data[ data$EVTYPE %in% c('HEAVY SURF/HIGH SURF'), "EVTYPE" ] <- "HEAVY SURF"
data[ data$EVTYPE %in% c('WINDS'), "EVTYPE" ] <- "WIND"
data[ data$EVTYPE %in% c('STORM SURGE/TIDE'), "EVTYPE" ] <- "STORM SURGE"
data[ grepl("^THUNDERSTORM WIND.*", data$EVTYPE), "EVTYPE" ] <- "THUNDERSTORM WIND"
message("Remove spaces from the start and end of event names")
data$EVTYPE <- gsub("^\\s+", "", data$EVTYPE, perl=TRUE)
data$EVTYPE <- gsub("\\s+$", "", data$EVTYPE, perl=TRUE)
