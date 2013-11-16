
   class MatrizDensa < Matriz

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

	


end #end class
