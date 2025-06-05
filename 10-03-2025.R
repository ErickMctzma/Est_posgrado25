# Regresión lineal
# Coeficiente de determinación se llama R
# La función es lm (lineal model). Es importante cuál es la variable es la dependiente.

geyser <- read.csv("erupciones.csv", header = T)

plot(geyser$waiting,geyser$eruptions, xlab = "Tiempo de espera (min)", ylab = "Duración (min)")
cor(geyser$waiting, geyser$eruptions)
# R=0.90 ; FUERTE CORRELACIÓN.

cor.test(geyser$waiting, geyser$eruptions)
# correlación fuerte, y alto valor de significancia.
# Con cor.test tmb determino p-value


# Modelo de regresión lineal
g.lm <- lm(geyser$eruptions ~ geyser$waiting)
# Primero debe de ir la variable dependiente.(y)
g.lm 
summary(g.lm)
# El tiempo de espera del geyser me predice en un 80% de seguridad la duración de erupción.

# ¿Cuál es alfa y cuál es beta?
# Alfa es el intercepto y beta es el que te pone con el nombre.
# alfa es -1.87 y beta es 0.076

#Buena linea if la suma de diferencia se acerca a cero. Las diferencias de arriba  abajo de la línea de regresión.

#Graficar línea de tendencia
plot(geyser$waiting,geyser$eruptions, xlab = "Tiempo de espera (min)", ylab = "Duración (min)")
abline(g.lm)

# Residuales es para determinar la diferencia entre los valores reales y la media. La suma me da el ajuste de la linea de regresión.

# La varianza tmb se puede determinar con la sumatoria de los residuales al cuadrado. Porque es cuan dispersos están de la columna central.

# Se puede sacar en lugar de manual con una tabla de análisis de varianza. 



# Aquí cerramos la parte paramétrica con Tagle. Sigue con Estrada.
# Multivariados siguen. Más en ecológicas.
# Complementar esto cno la tabla que nos proporcionó Marmolejo en Licenciatura.




