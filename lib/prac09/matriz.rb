require 'prac09/fraccion'

class Matriz
	attr_reader :filas, :columnas

	def initialize(filas, columnas)
		@filas = filas
		@columnas = columnas	 
	end
       
	def Matriz.constructor(filas, columnas, *velementos)
		  longitud=filas*columnas

	          if (((velementos.count(0)*100)/(longitud))>=60)
			MatrizDispersa.new(filas,columnas, *velementos)
           	  else 
			MatrizDensa.new(filas, columnas, *velementos)
		  end
	end			

	#get filas
	def filas()
		@filas
	end
	
	#get columnas
	def columnas()
		@columnas
	end


	#operacion suma
	def +(object)
				#comprobamos que tea una matriz con las mismas filas y columnas
                if ( (@filas == object.filas) && (@columnas == object.columnas))
                        matrizresultado = Array.new(@filas*@columnas)
                        i = 0
                        ind = 0
                        while (i < @filas) do
                                j = 0
                                while (j < @columnas) do
                                        matrizresultado[ind]= (self[i,j] + object[i,j]) # sumamos los valores ij de cada matriz
                                        ind = ind +1
                                        j = j + 1
                                end
                                i = i + 1
                        end
                        Matriz.constructor(@filas, @columnas, matrizresultado)   
                end

	end

	#operador resta
	def -(object)
                if ((object.instance_of?(Matriz) == true) && (@filas == object.filas) && (@columnas == object.columnas))
                        matrizresultado = Matriz.new(@filas, @columnas)
                        i = 0
                        ind = 0
                        while (i < @filas) do
                                j = 0
                                while (j < @columnas) do
                                        matrizresultado[ind]= (self[i,j] - object[i,j]) # sumamos los valores ij de cada matriz
                                        ind = ind +1
                                        j = j + 1
                                end
                                i = i + 1
                        end
                        Matriz.constructor(@filas,@columnas,matrizresultado)
                end
        end
	
	#operador producto
	def *(object)
        	if ((object.instance_of?(Matriz)==true) && (@columnas==object.filas()))
                        i = 0
                        matrizresultado = Matriz.new(@filas, object.columnas())
                        while (i < @filas) do 
                                j = 0
                                while (j < object.columnas()) do
                                        k = 0
                                        matrizresultado[i,j]=0
                                        while (k < @columnas) do #itera en las columnas de la primera matriz y las filas de la segunda
                                                aux = (self[i,k] * object[k,j] + matrizresultado[i,j] )#formula del calculo del determinante
                                                matrizresultado[i,j]=aux	#almacena el valor obtenido en la posicion ij
                                                k = k + 1
                                        end
                                        j = j + 1
                                end
                                i = i + 1
                        end
                        return matrizresultado
                end
        end

	def ==(object)
		if ((@filas == object.filas) && (@columnas == object.columnas))
			i = 0
			while (i < @filas) do
				j = 0
				while (j < @columnas) do
					if (self[i,j] == object[i,j]) #comparamos elemento a elemento
						es_igual = true
					else 
						return es_igual = false #si solo uno es distinto la funcion devuelve falso
					end
					j = j + 1
				end
				i = i + 1
			end
		end
		return es_igual #si compara todos los elementos y son iguales devuelve verdadero
	end
        
     
end
