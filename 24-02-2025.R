#Semana 6
#Clase 5

#Análisis de Varianza (ANOVA). Más de dos tratamientos. Tienen que cumplir las mismas dos condiciones que las pruebas de T.
#Dif. entre grupos/tratamientos o del bloque (selección de individuos). 
#Prueba de comparación de medias. "Tuckey". 
#Experimentos balanceados y no balanceados. Sobre si los tratamientos tienen la misma cantidad de observaciones.

#Se utiliza la palabra VIAS cuando se refiere a la cantidad de variables que juegan entre sí en un análisis de varianza. (ejemplo 2, 3 vías)
#Bon ferrony, corrección para experimentos no balanceados. (Toma en cuenta que no hay iguales observaciones.)

#ANOVA. Se comparan las Medias. Y la varianza me sirve para saber si la diferencia viene del tratamiento o algo más.

library(repmis)
localidad <- (source_data("https://www.dropbox.com/s/fbrwxypacjgeayj/Datos_Rascon_Anova.csv?dl=1"))
boxplot(localidad$DAP ~ localidad$Paraje, col = "lightblue", xlab = "Paraje", ylab= "Diámetro (cm)")
#Tenemos 4 factores. Son las diferenciaciones de tratamiento.

shapiro.test(localidad$DAP)
# El valor es inferior a 0.05 por lo que se acepta la H1.No son normales.

shapiro.test(localidad$EDAD) #Tampoco normal.
?shapiro.test
hist(localidad$DAP)
# Aparentan curva pero no cumples con la normalidad.
bartlett.test(localidad$DAP ~ localidad$Paraje)
# Varianzas son iguales.

#Teoría de que todos los datos son normales, solo que no se ha alcanzado la cantidad de observaciones necesarias. 


# Transformación ----------------------------------------------------------


#Qué hago ahora? Transformación de datos. Reducir la variación.
# Transformaciones: log(x+1), raiz (x-0.5)
#¿Tienen nombres las transformaciones? 

#Transformar x (DAP) usando log10

localidad$dap_log<- round(log10(localidad$DAP + 1),2)
#Se graba como otra variable en el objeto al darle un nombre nuevo (dap_log).
View(localidad$DAP_log)
hist(localidad$DAP_log)

library(e1071)
# Medir lo sesgado. Arriba de 1 totalmente sesgado. Lo más cercano a 0 es nada sesgado. Menor a uno, moderadamente sesgados.El positivo o negativo indica 
#la inclinación de los valores con respecto a la media.
skewness(localidad$DAP)
#Está moderadamente sesgado

skewness(localidad$dap_log)
#Mejor, pero sigue sesgado

localidad$sqrt <- round(sqrt(localidad$DAP),2)
skewness(localidad$sqrt)
#Ya se ha eliminado el sesgo.
shapiro.test(localidad$sqrt)
#Son normales

hist(localidad$sqrt)
bartlett.test(localidad$sqrt ~localidad$Paraje)
#Por poco sin iguales las varianzas
#"Cuando está estandarizado, cuando la normaldiad se cumple, se dará tmb la varianza"

#Corchetes. [Fila, Columna]
# Puedes trabajar con objetos y quitarles columnas o filas completas con, ejemplo, localidad[,-5]. Lo que quitaría la columna 5

#aov
dap.aov <- aov(localidad$sqrt ~localidad$Paraje) 
#Punto para entender que le estás haciendo una transformación. Variable . y luego transformación realizada
?aov

#Tablas de analisis de varianza. 
#1. identificar fuente de variación. 
#Tratamiento
#error
#Total
#2.Grados de libertad
#3.Suma de cuadrados
#4.Cuadrado medio
#5.Valor de F

#Si el cuadrado medio es superior en Tratamiento, la dif es por tratamiento. 
#Pero si es en error, significa que la variación no es por tratamiento, si no por las observaciones (multiples variables)

dap.aov
#Residual tmb se le llama error.
summary(dap.aov)
#Resumen de objetos

84.03/3
97.99/116
28.011/.845
# Son distintos los sitios. El valor de p es menos a 0.05. Porque tiene tres *

#Comparación y constraste de medias.
tukey <- TukeyHSD(dap.aov)
#valor de p menor a 0.05, tienen diferencia significativa. 
#Cuando entre el valor lwr y upr pasa el cero, no hay diferencia. 

#compact letter display to show wich ones are different

library(multcompView)

boxplot(localidad$sqrt ~ localidad$Paraje)

cld <- multcompLetters4(dap.aov,tukey)
print(cld)

# https://statdoe.com/one-way-anova-and-box-plot-in-r/#compact-letter-display-to-indicate-significant-differences

# Para agregar las letras para la diferenciación podemos utilizar la librería multcompView.
