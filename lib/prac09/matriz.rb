require 'fraccion'
class Matriz
 
##########################hay que ponerle una condicion, si tiene mas de 60 ceros, construya una dispersa, si no una densa
        def initialize(filas, columnas)
            @filas = filas
	    @columnas = columnas    
        end
###########################	


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

end
