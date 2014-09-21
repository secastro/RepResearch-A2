message("Remove special characters")
data$EVTYPE <- gsub("[\001\002]", "", data$EVTYPE)
message("Remove two or more spaces")
data$EVTYPE <- gsub("\\s{2,}", " ", data$EVTYPE, perl=TRUE)
message("Express all events in uppercase")
data$EVTYPE <- toupper(data$EVTYPE)
message("Fix some miss-spellings")
data[ data$EVTYPE == "AVALANCE", "EVTYPE"] <- "AVALANCHE"
data[ data$EVTYPE == "BEACH EROSIN", "EVTYPE"] <- "BEACH EROSION"
data[ data$EVTYPE == "WND", "EVTYPE"] <- "HIGH WIND"
data[ data$EVTYPE %in% c('COASTALSTORM'), "EVTYPE" ] <- "COASTAL STORM"
data$EVTYPE <- gsub("MIRCOBURST", "MICROBURST", data$EVTYPE)
message("Uniforming events written in differeny ways")
data[ data$EVTYPE %in% c('WINTER STORM HIGH WINDS', 'WINTER STORM HIGH WINDS'), "EVTYPE" ] <- "WINTER STORM"
data[ data$EVTYPE %in% c('FLOOD/FLASH FLOOD', 'FLASH FLOOD/FLOOD',
'FLASH FLOODING/FLOOD', 'FLASH FLOODS', 'FLASH FLOODING',
'RAPIDLY RISING WATER'), "EVTYPE" ] <- "FLASH FLOOD"
data[ data$EVTYPE %in% c('COASTAL FLOODING', 'COASTAL FLOODING/EROSION',
'TIDAL FLOODING'), "EVTYPE" ] <- "COASTAL FLOOD"
data[ , "EVTYPE" ] <- gsub("^(HIGH WIND) 48$", "\\1", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(HIGH WIND) AND (SEAS)$", "\\1/\\2", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("(\\W)(WIND|RAIN|WAVE)S$", "\\1\\2", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(LIGHTNING)\\W.*", "\\1", data$EVTYPE, perl=TRUE)
# data[ , "EVTYPE" ] <- gsub("(\\W)RAINS$", "\\1RAIN", data$EVTYPE, perl=TRUE)
# data[ , "EVTYPE" ] <- gsub("(\\W)WAVES$", "\\1WAVE", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(THUNDERSTORMS|THUNDERSTORMW|THUNDERTORM)(.*)$", "THUNDERSTORM\\2", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^TSTM ","THUNDERSTORM ", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("(\\W)TSTM(\\W)","\\1THUNDERSTORM\\2", data$EVTYPE, perl=TRUE)
data[ , "EVTYPE" ] <- gsub("^(TORNADO)\\W.*","\\1 ", data$EVTYPE, perl=TRUE)
data[ data$EVTYPE %in% c('HEAT WAVE DROUGHT'), "EVTYPE" ] <- "HEAT"
data[ data$EVTYPE %in% c('RECORD HEAT'), "EVTYPE" ] <- "HEAT"
data[ grepl("^HURRICANE (EDOUARD|EMILY|FELIX|ERIN|OPAL|OPAL/HIGH WIND)$", data$EVTYPE, perl=TRUE), "EVTYPE"] <- "HURRICANE/TYPHOON" 
data[ grepl("^(HURRICANE|TYPHOON)$", data$EVTYPE, perl=TRUE), "EVTYPE"] <- "HURRICANE/TYPHOON" 
data[ data$EVTYPE %in% c('LANDSLIDES'), "EVTYPE" ] <- "LANDSLIDE"
data[ data$EVTYPE %in% c('MUDSLIDES'), "EVTYPE" ] <- "MUDSLIDE"
data[ data$EVTYPE %in% c('SNOW SQUALLS'), "EVTYPE" ] <- "SNOW SQUALL"
data[ data$EVTYPE %in% c('MARINE TSTM WIND'), "EVTYPE" ] <- "MARINE THUNDERSTORM WIND"
data[ data$EVTYPE %in% c('RIP CURRENTS'), "EVTYPE" ] <- "RIP CURRENT"
data[ data$EVTYPE %in% c('RIVER FLOODING', 'FLOODING', 'RIVER FLOOD'), "EVTYPE" ] <- "FLOOD"
data[ data$EVTYPE %in% c('WILD FIRES', 'WILD/FOREST FIRE', 'BRUSH FIRE'), "EVTYPE" ] <- "WILDFIRE"
data[ data$EVTYPE %in% c('TROPICAL STORM GORDON'), "EVTYPE" ] <- "TROPICAL STORM"
data[ data$EVTYPE %in% c('ICY ROADS', 'ICE ON ROAD', 'ICE', 'ICE ROADS',
'ICE STORM', 'ICE STORM/FLASH FLOOD', 'ICY ROAD', 'BLACK ICE'), "EVTYPE" ] <- "FROST/FREEZE"
data[ data$EVTYPE %in% c('WINTER STORMS'), "EVTYPE" ] <- "WINTER STORM"
data[ data$EVTYPE %in% c('WATERSPOUT TORNADO'), "EVTYPE" ] <- "WATERSPOUT"
data[ data$EVTYPE %in% c('WINTER WEATHER/MIX', 'WINTER WEATHER MIX',
'WINTRY MIX'), "EVTYPE" ] <- "WINTER STORM"
data[ data$EVTYPE %in% c('HEAVY SURF/HIGH SURF', 'HEAVY SEAS',
'ROUGH SEAS', 'ROUGH SURF', 'ROGUE WAVE', 'HIGH WAVE'), "EVTYPE" ] <- "HIGH SURF"
data[ data$EVTYPE %in% c('WINDS'), "EVTYPE" ] <- "HIGH WIND"
data[ data$EVTYPE %in% c('STORM SURGE/TIDE'), "EVTYPE" ] <- "STORM SURGE"
data[ grepl("^THUNDERSTORM WIND.*", data$EVTYPE), "EVTYPE" ] <- "THUNDERSTORM WIND"
data[ data$EVTYPE %in% c('THUNDERSTORM', 'THUNDERSNOW'), "EVTYPE" ] <- "THUNDERSTORM WIND"
message("Remove spaces from the start and end of event names")
data$EVTYPE <- gsub("^\\s+", "", data$EVTYPE, perl=TRUE)
data$EVTYPE <- gsub("\\s+$", "", data$EVTYPE, perl=TRUE)
message("Group some event type freely typed in by the event table defined in the NWS documentation")
data[ data$EVTYPE %in% c('COLD AND SNOW', 'COLD TEMPERATURE',
'RECORD COLD', 'COLD WAVE', 'COLD WEATHER', 'COLD/WIND',
'LOW TEMPERATURE', 'COLD'), "EVTYPE" ] <- "COLD/WIND CHILL"
data[ data$EVTYPE %in% c('DROUGHT/EXCESSIVE HEAT'), "EVTYPE" ] <- "DROUGHT"
data[ data$EVTYPE %in% c('EXTENDED COLD', 'EXTREME COLD',
'EXTREME WINDCHILL', 'UNSEASONABLY COLD'), "EVTYPE" ] <- "EXTREME COLD/WIND CHILL"
data[ data$EVTYPE %in% c('EXTREME HEAT', 'UNSEASONABLY WARM',
'UNSEASONABLY WARM AND DRY', 'WARM WEATHER'), "EVTYPE" ] <- "HEAT"
data[ data$EVTYPE %in% c('FLOOD & HEAVY RAIN', 'MINOR FLOODING',
'FLOOD/RIVER FLOOD', 'URBAN AND SMALL STREAM FLOODIN',
'URBAN/SML STREAM FLD'), "EVTYPE" ] <- "FLOOD" 
data[ data$EVTYPE %in% c('FOG'), "EVTYPE" ] <- "DENSE FOG" 
data[ data$EVTYPE %in% c('FOG AND COLD TEMPERATURES'), "EVTYPE" ] <-
"FREEZING FOG" 
data[ data$EVTYPE %in% c('FREEZE', 'FREEZING DRIZZLE', 'FREEZING RAIN',
'FREEZING RAIN/SNOW', 'FREEZING SPRAY', 'FROST', 'FREEZING FOG'), "EVTYPE" ] <- "FROST/FREEZE"
data[ data$EVTYPE %in% c('GLAZE', 'GLAZE/ICE STORM'), "EVTYPE" ] <- "ICE STORM"
data[ data$EVTYPE %in% c('HAZARDOUS SURF'), "EVTYPE" ] <- "HIGH SURF"
data[ data$EVTYPE %in% c('HEAT WAVE', 'RECORD/EXCESSIVE HEAT'), "EVTYPE" ] <- "HEAT"
data[ grepl("^HEAVY SNOW.*", data$EVTYPE) | data$EVTYPE %in%
c('EXCESSIVE SNOW'), "EVTYPE" ] <- "HEAVY SNOW"
data[ grepl("^(HEAVY SURF|HIGH SEAS|HIGH SWELLS|HIGH WATER).*", data$EVTYPE), "EVTYPE" ] <- "HIGH SURF"
data[ grepl("^HIGH WIND.*", data$EVTYPE) | data$EVTYPE %in% c('GUSTY WIND'), "EVTYPE" ] <- "HIGH WIND"
data[ grepl("^HYPERTHERMIA.*", data$EVTYPE), "EVTYPE" ] <- "HEAT"
data[ grepl("^HYPOTHERMIA.*", data$EVTYPE), "EVTYPE" ] <- "COLD/WIND CHILL"
data[ grepl("^RIP CURRENT.*", data$EVTYPE), "EVTYPE" ] <- "RIP CURRENT"
data[ data$EVTYPE %in% c('SMALL HAIL'), "EVTYPE" ] <- "HAIL"
data[ data$EVTYPE %in% c('EXCESSIVE RAINFALL', 'RAIN/SHOW', 'RAIN/WIND',
'TORRENTIAL RAINFALL'), "EVTYPE" ] <- "HEAVY RAIN"
data[ data$EVTYPE %in% c('MARINE MISHAP'), "EVTYPE" ] <- "MARINE ACCIDENT"
data[ data$EVTYPE %in% c('COASTAL STORM'), "EVTYPE" ] <- "MARINE STRONG WIND"
