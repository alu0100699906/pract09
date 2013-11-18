
class Matriz

	def initialize(filas, columnas)
    		@filas, @columnas = filas , columnas
  	end

	#get filas
	def filas()
		@filas
	end
	
	#get columnas
	def columnas()
		@columnas
	end

       
  	def Matriz.constructor(filas, columnas, velementos)

      		longitud=filas*columnas
     		 if (((velementos.count(0)*100)/(longitud)) >= 60)

        		MatrizDispersa.new(filas,columnas,velementos)
      		else 

        		MatrizDensa.new(filas,columnas,velementos)
      		end
  	end


	def +(object)
    		
		if ( (@filas == object.filas) && (@columnas == object.columnas))
      
			matrizresultado=Array.new
			i = 0
			while (i < @filas) do
        	
				j=0
				while (j < @columnas) do
          		
					matrizresultado << (self[i,j] + object[i,j])
            				j=j+1
        			end
         			i=i+1
      			end
      			Matriz.constructor(@filas, @columnas, matrizresultado)
    		end
  	end
  

	def -(object)
    		
		if ( (@filas == object.filas) && (@columnas == object.columnas))
      
			matrizresultado=Array.new
			i = 0
			while (i < @filas) do
        	
				j=0
				while (j < @columnas) do
          		
					matrizresultado << (self[i,j] - object[i,j])
            				j=j+1
        			end
         			i=i+1
      			end
      			Matriz.constructor(@filas, @columnas, matrizresultado)
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

	def *(object)

		if(object.is_a? Numeric)
      			matrizresultado=Array.new
      			i=0
			while (i<@filas)
				j=0
				while (j<@columnas)
					matrizresultado << (self[i,j]*object)
					j=j+1
        			end
				i=i+1
			end
			return Matriz.constructor(@filas,@columnas,matrizresultado)
     	        

		elsif ((object.is_a?(Matriz)==true) && (@columnas==object.filas()))
			i=0
                        matrizresultado = Array.new
                        while (i < @filas) do 
                                j = 0
                                while (j < object.columnas()) do
                                        k = 0
                                        matrizresultado<<0
                                        while (k < @columnas) do #itera en las columnas de la primera matriz y las filas de la segunda
                                                matrizresultado[(matrizresultado.size)-1]= (matrizresultado.last + (self[i,k] * object[k,j]))
                                                k = k + 1
                                        end
                                        j = j + 1
                                end
                                i = i + 1
                        end
                        Matriz.constructor(@filas,object.columnas,matrizresultado)
                end
        end
 
	def max()
		maximo = 0 # maximo provisional
		i, j = 0,0
		while i<=@filas
			while j<=@columnas
				if (self[i,j]>maximo) #si el valor es mayor que el provisional almacena el nuevo
					maximo = self[i,j]
				end
				j += 1;
			end
			i += 1;
		end
		return maximo
	end
	
	def min()
		minimo = 0 # maximo provisional
		i, j = 0,0
		while i<=@filas
			while j<=@columnas
				if (self[i,j]<minimo) #si el valor es mayor que el provisional almacena el nuevo
					minimo = self[i,j]
				end
				j += 1;
			end
			i += 1;
		end
		return minimo
	end
                     
  
  	def coerce(object)
    		[self,object]
  	end
  
end
