#===========================================#
# author: Eduard Fernando Martínez González
# update: 11-11-2021
# R version 4.1.1 (2021-08-10)
#===========================================#

# initial configuration
rm(list=ls()) # limpiar entorno
Sys.setlocale("LC_CTYPE", "en_US.UTF-8") # Encoding UTF-8
set.seed(12345) # fijar semilla

# load packages
require(pacman)
p_load(tidyverse , rio , data.table , png , grid)

## Hoy veremos

### **1.** Bucles

### **2.** Controles de flujo

### **3.** Aplicación CHIP

#=================#
#=== 1. Bucles ===#         
#=================#

#----------------------#
## Estructura de datos
browseURL(url = "https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r", browser = getOption("browser")) # Datacamp
browseURL(url = "https://bookdown.org/jboscomendoza/r-principiantes4/estructuras-de-control.html", browser = getOption("browser")) # R para principiantes
browseURL(url = "https://intro2r.com/loops.html#for-loop", browser = getOption("browser")) # intro2r

#----------------------#
## Estructura de datos
dev.off()
grid.raster(readPNG("input/pics/bucle_flow.png")) # source: datacamp
browseURL("")

#----------------------#
## Estructura de un bucle (for)
vector =  1:5
for (i in c(1,2,3,4,5)){ # Vector sobre el que se va a aplicar el loop *primero es el que se va a ir cambianndo en cada interación,aquí i irá tomando el valor de cada uno de los que esta dentro del vector
     casa = i*i  # Sobreescribe i como el resultado de i*i
     print(casa) # Pinta el resultado sobre la consola (cuando i sea 3, casa sera igual a 3 por 3)
}

for (i in vector){ # igual que el anterior
  casa = i*i  # Sobreescribe i como el resultado de i*i
  print(casa) # Pinta el resultado sobre la consola (cuando i sea 3, casa sera igual a 3 por 3)
}


results = tibble(i = 1:5 , resultado = NA) #un dataframe con dos columnas -una llamada i con # y otra llamada resultado con valores en blanco
for (i in vector){ # Vector sobre el que se va a aplicar el loop
     n = i
     casa = i*i  # Sobreescribe i como el resultado de i*i
     print(casa) # Pinta el resultado sobre la consola
     results$resultado[n] = casa
}

results #para ver si si quedo en las columnas

results1 = tibble(i = 1:5 , resultado = NA)
for (i in vector){ # Vector sobre el que se va a aplicar el loop
     n = i # n es para la posición; en la columna de resultados ponga la posición n
     casa = i*i*i  # Sobreescribe i como el resultado de i*i
     print(casa) # Pinta el resultado sobre la consola
     results1$resultado[n] = casa
}

#----------------------#
## Estructura de un bucle (repeat) #calibrar modelos macro, busco un eq y quiero que la itere hasta encontrar el valor
repeat{ #quiero que aplique algo y mientras la condición no se cumpla
       m = rnorm(n=1 , mean=10 , sd=2) # generar un número aleatorio (media 10 , sd 2) 
       print(m) # pintar el número sobre la consola
       if (m <= 8){ # condicionar a que ese número sea menor o igual a 8 ** aquí rompo el loop
           break # detener el loop si m es menor o igual a 8 
       } 
}

#----------------------#
## Estructura de un bucle (while)
j = 1 #antes tenia un vector que quiero iterar, aqui es que mientras j sea igual o menor a 5 que siga
while (j <= 5) { # condición
       print(j*j) # pintar sobre la consola el producto de j*j
       j = j+1 # sobreescribir j como j + 1
} #si quiero que sea infinito es restarle un 1 e ira a menos infinito, si fuera j==j o quitando el que va despues de print

#----------------------#
## Veamos un ejemplo

#### generate data
df = tibble(cod_mpio = c(5001,5002,5003,5004,5005,5006),	
            violencia_2014	= c(0.05,0.07,0.06,0.03,0.04,0.03),
            violencia_2015	= c(0.09,0.05,0.03,0.06,0.03,0.01),
            violencia_2016	= c(0.02,0.04,0.03,0.02,0.03,0.00),
            violencia_2017	= c(0.03,0.06,0.03,0.01,0.04,0.01),
            violencia_2018	= c(0.01,0.02,0.04,0.05,0.07,0.01),
            violencia_2019  = c(0.01,0.02,0.02,0.03,0.03,0.01))

cat("El loop se aplica desde la columna 2 (porque la columna 1 contiene el código DANE) hasta la última columna del dataframe.")

df
for(i in 2:ncol(df)){ # defino el vector sobre el que quiero iterar; desde la posición 2 hasta la 7 (hasta tantas columnas que tiene) podía poner  i in 2:7 también
    df[,i] = df[,i]*100 #que la columna 2 = a esa misma columna multiplicada por 100
}
df #si lo vuelve a aplicar sobreescribe el objeto

#ahora con los nombres
names_df = colnames(df) [2:7]
names_df
for(i in names_df){ # defino el vector sobre el que quiero iterar; desde la posición 2 hasta la 7 (hasta tantas columnas que tiene) podía poner  i in 2:7 también
  df[,i] = df[,i]*100 #que la columna 2 = a esa misma columna multiplicada por 100
}
df
#=============================#
#=== 2. Controles de flujo ===#         
#=============================#

#----------------------# puedo usar el if o el else para imponer estructura o condicion al interior
## if & else
cat("los controles de flujo regulan la ejecucion de los codigos dentro de los diferentes tipos de loops")
letters
for (letra in letters) {
  
     if (letra %in% c("a","e","i","o","u")){
         print(paste0(letra," - Es una vocal")) #qro que me pinte que letra es una vocal
     }
    
     else {
           print(paste0(letra," - NO es una vocal")) #si no es vocal no ejecuta la linea anterior de codigo
     } 
}

#----------------------#
## next & breack
cat("next es un condicional que le permite al loop saltar al siguiente elemento del loop")

for(i in 1:20) {
    if(i %% 2 == 0){ next } # se salta a la siguiente linea * si es divisible por 2 que salte al siguiente valor, no me lo pinte. podria en vez de poner next, break
    print(i)
}

#==========================#
#=== 3. Aplicación CHIP ===# b    
#==========================#

cat("Hacer en clase")

#----------------------#
## 1. Lista de archivos 
rutas = list.files("input/chip",full.names = T , recursive = T) #recursivo es para que si hya muchas carpetas me copie el numero de las carpetas

#----------------------#
## 2. Hacer ejemplo para una observación

## 2.1. Leer archivo
df = import(file = rutas[1]) #lei el archivo en la primera posicion
df

## 2.2. Obtener codigo-DANE 
name = colnames(df) [1]
name
## 2.3. Obtener tipo de inversion
tipo = df[8,2] #fila 8 y columna 2
tipo

## 2.4. Obtener valor
valor = df[8,8]
valor
## 2.5. Exportar resultados
data = tibble(codigo=name , tipo_inv=tipo , valor_inv=valor)
data
#----------------------#
## 3. Generalizar loop
data = tibble(codigo=rep(NA,40),
              tipo_inv=rep(NA,40),
              valor_inv=rep(NA,40))

for (i in 1:40){ #en vez de uno ser i
  df = import(file = rutas[i]) #lei el archivo en la primera posicion
  name = colnames(df) [1]
  tipo = df[8,2] #fila 8 y columna 2
  valor = df[8,8]
  data [i,1] = name
  data [i,2] = tipo
  data [i,3] = valor
  
}









