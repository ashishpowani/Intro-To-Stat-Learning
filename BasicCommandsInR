#Concatenate the values in a variable
x <- c(1,2,3,4,5)
x
y=c(1,4,5,7,8)
y
length(x)

#Sum of x and y
x+y

#Creating a matrix
x=matrix(data=c(1,2,3,4),nrow=1, ncol=2)
x
rm(x)  #remove the object x
ls() #lists the list of all the objects

x=matrix(data=c(1,2,3,4),nrow=2, ncol=2)
x
y=matrix(data=c(5,6,7,8), 2,2, byrow=TRUE)
y
sqrt(y)
y^2

#Generating a random variable and computing the correlation
x=rnorm(50)
x
y=x+rnorm(50, mean=50, sd=.1)
y

cor(x,y)

#If we want to reproduce the same set of random numbers
set.seed(80)
a=rnorm(50)
a

#computing Mean, Variance and SD
mean(a)
var(a)
sqrt(var(a))
sd(a)

#Graphics - Scatter Plot
x=rnorm(100)
x
y=rnorm(100)
y
plot(x,y)
plot(x, y, xlab = "This is X-axis", ylab = "This is theY-axis", main="Plot of X vs Plot of Y",col="green")

pdf("Graphics.pdf")
plot(x,y,col="green")
dev.off()

#To create a sequence of numbers
a=seq(1,10)
a
b=11:20
b
plot(a,b)

c=seq(-pi,pi,length=50)
c

#Contour
x=seq(1,10)
y=x
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa=(f-t(f)/2)
contour(x,y,fa,nlevels=15)

image()
image(x,y,fa,nlevels=15)

#How to draw a perspective plot of a surface
image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta = 30, phi=20)
persp(x,y,fa,theta = 30,phi = 70)
persp(x,y,fa,theta=30,phi = 40)

## Indexing Data

A=matrix(1:16,4,4)
A
A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
dim(A) 

## Loading Data

Auto=read.table("Auto.data", header=TRUE, na.strings = "?")
#fix(Auto)
View(Auto)

library(ISLR)
head(Auto)

AutoA=read.csv("Auto.csv",header=TRUE, na.strings="?")
View(AutoA)

#Dim to display the no of observations(rows) and the no of variables (columns)
dim(AutoA)  

#This displays the 1st 4 rows of all the columns
Auto[1:4,]

#This should display the 1st rows for the 1st 6 columns(variables)
Auto[1,1:6]

Auto=na.omit(Auto)
dim(Auto)

names(Auto)


## Additional Graphical and numerical summaries

# Wrong syntax
# plot(cylinders, mpg)

plot(Auto$cylinders, Auto$mpg)

attach(Auto)
plot(cylinders,mpg)

View(Auto)

# Convert quantitative to qualitative variable -- as.factor
cylinders=as.factor(cylinders)

# If the x-axis has the qualitative variable then the plot function will generate the boxplot by default
plot(cylinders, mpg)
plot(cylinders,mpg, col="red")
plot(cylinders,mpg, col="red", varwidth=TRUE, horizontal=TRUE)
plot(cylinders, mpg, col="red", varwidth=TRUE, xlab="cylinders", ylab="MPG")

# Draw a histogram
hist(mpg)
hist(mpg, col=2)
hist(mpg, col=3, breaks= 15)

# Create a scatterplot matrix for every pair of variables
pairs(Auto)

# Scatterplot for a subset of the variables
pairs(~mpg + displacement + horsepower + weight + acceleration, Auto )

plot(horsepower, mpg)
identify(horsepower, mpg, name)
## once the above identify line is run, output is not generated rather it keeps on running

summary(Auto)
summary(mpg)
