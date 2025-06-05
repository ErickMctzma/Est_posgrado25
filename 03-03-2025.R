# Clase 03/03/25

costal <- c(87.7,80.01,77.28,78.76,81.52,74.2,80.71,79.5,77.87,81.94,80.7,
            82.32,75.78,80.19,83.91,79.4,77.52,77.62,81.4,74.89,82.95,
            73.59,77.92,77.18,79.83,81.23,79.28,78.44,79.01,80.47,76.23,
            78.89,77.14,69.94,78.54,79.7,82.45,77.29,75.52,77.21,75.99,
            81.94,80.41,77.7)
length(costal)
mean(costal)

#darnos una idea de la distribución
plot(density(costal))
abline(v=mean(costal, col="green", lwd=2, lty=2))
abline(v=80, col="red", lwd=1, lty=3)
#abline agrega una máscara, una línea; v es por vertical; lwd es line wide; lty es la versión punteadam etc
hist(costal)
abline(v=mean(costal, col="green", lwd=1, ))

shapiro.test(costal)
#Son normales

t.test(costal, mu=80, alternative = "greater")
#Si pones "less" or "greater" para establecer cual es tu hipótesis alternativa (dependiendo del problema), cambia el p-value que te da.
View(sleep)

#Sí es experimento balanceado
boxplot(sleep$extra ~sleep$group)
shapiro.test(sleep$extra )
bartlett.test(sleep$extra ~sleep$group)
#Datos normales y varianzas equitativas(?)

t.test(sleep$extra ~sleep$group)

#Sleep y airquality son base de datos guardados en Rstudio


View(airquality)
summary(airquality)
# El NA's son faltas de datos.

# Comparamos con una teorética (en este caso el promedio de todos los meses)
mean(airquality$Temp)
mayotemp <- subset(airquality$Temp, airquality$Month == "5")
mean(mayotemp)

shapiro.test(mayotemp)
t.test(mayotemp, mu=77.88, alternative="less")

boxplot(airquality$Temp ~ airquality$Month)
airquality$celsius <- round((airquality$Temp -32)/1.8,1)

shapiro.test(airquality$celsius)
bartlett.test(airquality$celsius ~ airquality$Month)
#No son varianzas iguales

boxplot(airquality$Solar.R ~ airquality$Month)
boxplot(airquality$Wind ~ airquality$Month)

bartlett.test(airquality$Wind ~ airquality$Month)             

wind.aov <- aov(airquality$Wind ~ airquality$Month)
summary(wind.aov)

#El mes no se estaba considerando como un factor (discreto), int es numeros completos, num es numeros con decimales (en el Environment cuando te dice
#qué es cada variable dentro de tu objeto)
airquality$Month <- as.factor(airquality$Month)

TukeyHSD(wind.aov)
#Solo 5-7 y 5-8 son distintos.



