#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

number.add.width<-800                            
number.add.height<-800    

png("plot1.png", width=number.add.width, height=number.add.height)

total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
clrs <- c("yellow", "orange", "blue", "red")
x1<-barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
            main=expression('Total PM'[2.5]*' emissions per year in kilotons'),col=clrs)

text(x = x1, y = round(total.emissions$Emissions/1000,2), label = round(total.emissions$Emissions/1000,2), pos = 3, col = "black")

dev.off()