# Clase 10/02/25
# Me dio problema Markdown para actualizar en el dispositivo.
# Importar datos a R proveniente de distintas fuentes


# Importar datos ----------------------------------------------------------
# Usamos la función "read.csv"

ocampo <-read.csv("Datos_ocampo.csv", header = T)
# Importante para estadística mencionar que tiene encabezado (header), incluir el tipo de formato que es (.csv), y el nombre que sea entre comillas.
ocampo
getwd() # getwd() nos informa de la carpeta en la que estamos trabajando.

names(ocampo)

mean(ocampo$TEMP) #funcion(objeto$variable).  el signo de pesos focaliza.

mean(ocampo$DIRS)

#Las graficas histograma no es lo mismo que las graficas de barra. Histogramas me brindan la frecuencia de valores. La grafica de barras me brinda acumulación de valores, no frecuencia.

boxplot(ocampo$TEMP, col = "orange", main= "Temperatura Ocampo") 
#indica el 100% de los datos. La caja gris indica el 50% de los datos. Del cuadro hacia las líneas exteriores son 25% (25 hacia abajo y 25 hacia arriba).
# La línea negra es la MEDIANA (valor más repetido). Este ejemplo nos dice que la curva está inclinada a los valores más bajos, en su distribución.
# Los colores van en comillas.

hist(ocampo$TEMP, col= "indianred", 
     main= "Temperatura Ocampo", 
     xlab = "Temperatura (°c)", 
     ylab = "Frecuencia")

# Estadística paramétrica y no paramétrica. Paramétrica es más robusta. Hay una contraparte para cada modelo de una u otra.
# Transformación de los datos para tratar de pasar de no-paramétrica a paramétrica.

#Experimento balanceado y no-balanceado. Balanceado es cuando los tratamientos tienen misma cantidad de objetos de estudio.

stem(ocampo$TEMP) 
#Tallo y hoja. El entero en la primera columna y los demás valores son los decimales. 
#Si la acuestas se parece a un histograma. Usada cuando se empleaban maquinas de escribir. 

#Boxplot también te da los valores extremos (outlayers). Se representan como puntos/circulitos. Errores de dedo o casos especiales. Boxplot es más completa.
boxplot(ocampo$VELR)

vivero <- read.csv("Viveros.csv", header = T)
vivero$Tratamiento <- as.factor(vivero$Tratamiento)
boxplot(vivero$IE ~ vivero$Tratamiento, xlab="Tratamientos", ylab="IE")

# as.factor indica que una columna es un factor determinante para los valores. Pasar de una base de datos compleja a sencilla para poder usarla en el sistema.
# Sirve para analisis estadisticos más completos/complejos. Si no, no lo identifica como un factor. Ya que busca Factores.
# la virgulilla te dice que me grafique una variable con respecto a otra.

# T-student.
# Una muestra, dos muestras independientes y dos muestras dependientes.

# Una muestra: comparado con un valor definido. Una referencia. "Media teorética".
# Dos independientes: Dos grupos, misma variables.
# Dos dependientes: Un grupo, una variable, dos tiempos distintos.

#Homogeneidad de varianzas y normalidad de los datos. Factores clave.
# Normalidad: Shapiro-Wild, Kormogorov.
# Varianzas: Barlet, Prueba de F.

#Alfa. Límite. 0.05. Con un 95% de confiabilidad en el resultado.
# p-value. Contrastar con Alfa. -1 a 1. # ¿Qué pedo con p-value y alfa.




# Clase 17/02/25
# Alfa
# Menos espacio para la hipótesis alternativa.
# El mainspace es para la hipótesis nula.
# Por default viene para dos colas
# Si hay diferencia o no (dos colas)
# Especificaciones para (mi media es mayor, o menos qué) (una cola)

# SHAPIRO.TEST




# Revisar normalidad de los datos
shapiro.test(vivero$IE)
# p es el valor que contrastaré contra el valor de 0.05 (normalmente, dependiendo el valor de alfa)
# la prueba de normalidad dice la Ho que son datos normales, y la H1 que NO son normales. 
# Si p es mayor a 0.05, significa que entra en el área de Ho.
# Para este caso, la normalidad de vivero$IE es de 0.1777, lo que hace que se pase de 0.05 y entre a la hipótesis nula.
# Se leen de derecha a izquierda.
# Tienen que tener al menos 30 datos. 
# LA TEORÍA DEL LÍMITE CENTRAL de que todos los datos de la naturaleza cumplen con una normalidad. 


# Cualquier prueba estadística te brindará un valor de p
# En pruebas de dos colas, los límites para el mismo valor de alfa(0.95) son de 0.025 y están en ambos lados,
# siendo el de la izquierda negativo y el derecho positivo, el centro es el 0. 
# Importante diferenciar qué tipo de análisis se tiene para entender si, por ejemplo, un valor de 0.049 es aceptar la H1 en una cola, o la H0 en dos colas.
?subset
ctrl <- subset(vivero$IE, vivero$Tratamiento == "Ctrl")
fert <- subset(vivero$IE, vivero$Tratamiento != "Ctrl")
var(fert)
var(ctrl)

# Revisar homogeneidad de varianzas
bartlett.test(vivero$IE ~ vivero$Tratamiento)
#Las varianzas son iguales.

# Tenemos homogeneidad en las varianzas y normalidad de datos

# Prueba de t de dos muestras independientes
t.test(vivero$IE~ vivero$Tratamiento, var.equal=T)
# t tab se contrasta con t cal.
# Los grados de libertad (numero de datos totales  - tratamientos)
# Cuando los grados de libertad no son enteros se está usando la prueba con las varianzas no iguales.

#Para indicar si la prueba de t es con variables dependientes se agrega paired = T en la prueba de tes.
# t.test(vivero$IE ~ vivero$Tratamiento, paired = T)
t.test(vivero$IE ~ vivero$Tratamiento, paired = T)

# La diferencia en los grados de libertad que salen con ambos, es que en la prueba independitente te considera, en este caso, que hay 42 individuos
# que se dividen en dos tratamientos. Y la prueba dependiente considera que hay 21 individuos que se han medido dos veces, con diferencia en el tiempo.