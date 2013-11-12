
   class MatrizDispersa < Matriz

         #constructor
         def initialize(filas, columnas, *elementos) 
                super(filas,columnas)
                @matriz = Array.new(filas, nil) #vector para almacenar los elementos
                i = 0
                #ahora los introducimos
                while i<columnas do
                        @matriz[i] = Array.new(columnas, nil)
                        i = i + 1
                end

                i = 0
                while (i < filas) do
                        j = 0
                        while (j < columnas) do
                                @matriz[i][j] = elementos.shift
                                j = j + 1
                        end
                        i = i + 1
                end
        end #end initialize


        #get elemento i,j
	def [](i,j)
		@matriz[i][j]
	end

	#set elemento i,j
	def []=(i,j,valor)
		@matriz[i][j] = valor
	end

        #operacion de igualdad
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

end #end class
