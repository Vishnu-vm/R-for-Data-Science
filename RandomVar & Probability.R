#PROBABILITY OF NORMAL DISTRIBUTION

1-pnorm(80,60,10) # prob of greater than 80 == 1-(prob of less than 80)

pnorm(70,60,10)  # prob of less than 70 with mean 60 and sd 10

pnorm(680,711,29)  #prob of getting lesss than 680 in gmat with mean 711 ans sd 29

        pnorm(730,711,29)-pnorm(690,711,29) #prob of getting btwn 690 & 730
                    ########OR####                    
        x<-pnorm(730,711,29)
        y<-pnorm(690,711,29)
        x-y
        
qnorm(0.975)   #to get z value corresp to the area
