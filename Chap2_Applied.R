library(ISLR)
head(College)

#8 a)
college = read.csv(file.choose(),header=T)
View(college)

#Displays the no of rows and columns
dim(college)

#Displays the names of all the variables
names(College)

# 8 b)
fix(college)
rownames(college) = college[,1]
college = college[,-1]
fix(college)

View(college)

# c i) To display the summary
summary(college)

# c ii)
pairs(college[,1:10])
#Scatterplot of apps and accept
pairs(~Apps+Accept,college)

# c iii)
plot(college$Outstate, college$Private)
plot(college$Private, college$Outstate, col="red", xlab = "Private", ylab="Outstate in y")

# c iv)
names(college)
Elite= rep("No",nrow(college))
Elite[college$Top10perc>50]='Yes'
Elite =as.factor(Elite) #Convert quantitative to qualititave variable
college =data.frame(college,Elite)
summary(college$Elite)
plot(college$Elite, college$Outstate)

# c v)
par(mfrow=c(2,2))
hist(college$Apps)
hist(college$perc.alumni, col=2)
hist(college$S.F.Ratio, col=3, breaks=10)
hist(college$Expend, breaks=100)

# c vi)
par(mfrow=c(1,1))
plot(college$Outstate, college$Grad.Rate)
#High Tuition rate for outstate residents correlates to high graduation rate
plot(college$Accept / college$Apps, college$S.F.Ratio)
#colleges with low acceptance rate has low S.F Ratio
plot(college$Top10perc, college$Grad.Rate)
#Colleges with most students from top 10% dont necessarily have the highest 
#graduatin rate and the value more than 100 is erroneous

#------------------------------------------------------------------------------
# 9)
dim(Auto)
Auto = read.csv(file.choose(),header = TRUE,na.strings = "?")
Auto= na.omit(Auto)
dim(Auto)

head(Auto)
View(Auto)

# a) Quantitative predictors - All except name, origin
#    Qualitative predictors - Only name and origin

# b)   apply the range function to the first seven columns of Auto
sapply(Auto[,1:7], range)

# c) Mean and Std Deviation
sapply(Auto[,1:7],mean)
sapply(Auto[,1:7],sd)

# d) Remove observations 

myData <- Auto[-c(10:85), ]
View(myData)
dim(myData)

sapply(myData[,1:7],range)
sapply(myData[,1:7],mean)
sapply(myData[,1:7],sd)

# e) 
pairs(Auto)

plot(Auto$mpg, Auto$weight)
# Heavier weight correlates with lower mpg.
plot(Auto$mpg, Auto$cylinders)
# More cylinders, less mpg.
plot(Auto$mpg, Auto$year)
# Cars become more efficient over time.

# f)
# All of the predictors show some correlation with mpg. The name predictor has 
# too little observations per name though, so using this as a predictor is 
# likely to result in overfitting the data and will not generalize well.

##-----------------------------------------------------------------------------

# 10) 
# a)
library(MASS)
View(Boston)
names(Boston)
dim(Boston)

# b)
pairs(Boston)
# X correlates with: a, b, c
# crim: age, dis, rad, tax, ptratio
# zn: indus, nox, age, lstat
# indus: age, dis
# nox: age, dis
# dis: lstat
# lstat: medv

# c)
cor(Boston)
plot(Boston$age, Boston$crim)
#Older homes, more crimes
plot(Boston$dis, Boston$crim)
#Closer to work area, then crime rates increase
plot(Boston$rad, Boston$crim)
#Higher index of accessibility to radial highways, more crime
plot(Boston$tax, Boston$crim)
#Tax rate increases, crime rate also increases
plot(Boston$ptratio, Boston$crim)
#Higher the pupil teacher ratio, the crime rate increases

# d)
par(mfrow=c(1,3))
hist(Boston$crim[Boston$crim>1], breaks=25)
# most cities have low crime rates, but there is a long tail: 18 suburbs appear
# to have a crime rate > 20, reaching to above 80
hist(Boston$tax, breaks=25)
# there is a large divide between suburbs with low tax rates and a peak at 660-680
hist(Boston$ptratio, breaks=25)
# a skew towards high ratios, but no particularly high ratios

# e)
hist(Boston$chas, breaks=25)
dim(subset(Boston, chas==1))
#35 suburbs

# f)
median(Boston$ptratio)

# (g)
t(subset(Boston, medv == min(Boston$medv)))
#              399      406
# crim     38.3518  67.9208 above 3rd quartile
# zn        0.0000   0.0000 at min
# indus    18.1000  18.1000 at 3rd quartile
# chas      0.0000   0.0000 not bounded by river
# nox       0.6930   0.6930 above 3rd quartile
# rm        5.4530   5.6830 below 1st quartile
# age     100.0000 100.0000 at max
# dis       1.4896   1.4254 below 1st quartile
# rad      24.0000  24.0000 at max
# tax     666.0000 666.0000 at 3rd quartile
# ptratio  20.2000  20.2000 at 3rd quartile
# black   396.9000 384.9700 at max; above 1st quartile
# lstat    30.5900  22.9800 above 3rd quartile
# medv      5.0000   5.0000 at min
summary(Boston)
# Not the best place to live, but certainly not the worst.

# h) 
dim(subset(Boston, rm>7))
#64
dim(subset(Boston, rm>8))
#13
summary(subset(Boston, rm>8))
summary(Boston)
# relatively lower crime (comparing range), lower lstat (comparing range)