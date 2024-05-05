getwd()
setwd("/Users/cuiying/Desktop/R")


emp <- read.csv("RegionalLabour.csv")
industry <- read.csv("employed-persons-industry-qld-1985-86-to-2022-23.csv")
occupation <- read.csv("employed-persons-occupation-qld-1991-92-to-2022-23.csv")

str(emp)
colnames(emp)[colnames(emp) == "Statistical.area.level.4"] <- "StatisticalArea"
colnames(emp)[colnames(emp) == "Employment.growth..monthly."] <- "EmploymentGrowth"
colnames(emp)[colnames(emp) == "Unemployment.rate"] <- "UnemploymentRate"
colnames(emp)[colnames(emp) == "Participation.rate"] <- "ParticipationRate"
str(emp)

emp$Month <- as.Date(paste("01", emp$Month), format = "%d %b %Y")
emp$StatisticalArea <- factor(emp$StatisticalArea)

head(emp,3)
tail(emp,10)
emp.backup <- read.csv("RegionalLabour.csv")

emp[!complete.cases(emp),]
emp <- na.omit(emp)
head(emp)
tail(emp)
summary(emp)

write.csv(emp, file = "DEmployment-Unemployment-Participation.csv", row.names = FALSE)

str(industry)
colnames(industry) <- NULL
industry <- t(industry)
head(industry)
tail(industry)
write.csv(industry, file = "Industry.csv", row.names = FALSE)

indu <- read.csv("Industry.csv")
colnames(indu) <- NULL
indu
write.csv(indu, file = "Industry.csv", row.names = FALSE)

str(occupation)
colnames(occupation) <- NULL
occupation <- t(occupation)
head(occupation)
write.csv(occupation, file = "Occupation.csv", row.names = FALSE)

occu <- read.csv("Occupation.csv")
colnames(occu) <- NULL
write.csv(occu, file = "Occupation.csv", row.names = FALSE)
