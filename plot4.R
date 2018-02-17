#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

number.add.width<-800                            
number.add.height<-800    

png("plot4.png", width=number.add.width, height=number.add.height)

combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]

emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
emissions.coal.related <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))
ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill = year),colour = "white")

dev.off()