require 'prac09/fraccion'
class Matriz
 
	def initialize(filas, columnas, *elementos)
		@filas = filas
		@columnas = columnas
		if (((elementos.count(0)*100)/(filas*columnas)) >= 60) # Matriz dispersa
		else
			MatrizDispersa.new (filas,columnas,elementos)
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
                if ((object.instance_of?(Matriz) == true) && (@filas == object.filas) && (@columnas == object.columnas))
                        matrizresultado = Matriz.new(@filas, @columnas)
                        i = 0
                        while (i < @filas) do
                                j = 0
                                while (j < @columnas) do
                                        valorsumado = 0
                                        matrizresultado[i,j] = @matriz[i][j] + object[i,j] # sumamos los valores ij de cada matriz
                                        
                                        j = j + 1
                                end
                                i = i + 1
                        end
                        return matrizresultado
                end
        end

	

	#operador resta
	def -(object)
                if ((object.instance_of?(Matriz) == true) && (@filas == object.filas) && (@columnas == object.columnas))
                        matrizresultado = Matriz.new(@filas, @columnas)
                        i = 0
                        while (i < @filas) do
                                j = 0
                                while (j < @columnas) do
                                        valorsumado = 0
                                        matrizresultado[i,j]= @matriz[i][j] - object[i,j] #se restan los elementos ij de las dos matrices
                                        
                                        j = j + 1
                                end
                                i = i + 1
                        end
                        return matrizresultado
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
                                                aux = (@matriz[i][k] * object[k,j] + matrizresultado[i,j] )#formula del calculo del determinante
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
		if ((object.instance_of?(Matriz) == true)&& (@filas == object.filas) && (@columnas == object.columnas))
			i = 0
			while (i < @filas) do
				j = 0
				while (j < @columnas) do
					if (@matriz[i][j] == object[i,j]) #comparamos elemento a elemento
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
