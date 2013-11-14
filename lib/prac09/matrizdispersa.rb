class MatrizDispersa < Matriz

	def initialize (filas, columnas, nonulo, *tuplas) 	
	#N es el numero de elementos no nulos
	#tuplas 
	# donde agrupamos de tres en tres vvalores vfil vcol

		super(filas, columnas)

		@n_nonulo = nonulo
	
		@vvalores = Array.new(nonulo)
		@vfil = Array.new(nonulo)
		@vcol = Array.new(nonulo)
	
		ind = 0
		while (ind < (3*nonulo))
			if (tuplas[ind] != 0)
				@vvalores[ind]=tuplas[ind]   #almacena el valor no nulo
			end
			if (tuplas[ind+1],tuplas[ind+2] <= @filas, @columnas) #comparamos que los valores sean posibles
				@vfil[ind]=tuplas[ind+1] # posicion filas de dicho elemento
				@vcol[ind]=tuplas[ind+2] # posicion columnas de dicho elemento
			end
		
			ind += 3	#vamos al siguiente trio v i j
		end
	
	end#end initialize

	def [](x,y) #getter
		i = 0
		while (i<@n_nonulo)
			if(@vfil[i] == x && @vcol[i] == y) 	#si encuentra la posicion 
				@vvalores[i]					#retorna el valor almacenado en ella
			end
			i += 1
			if (i = @n_nonulo)					#si no hay mas posiciones ocupadas
				return 0						#es que el elemento indice x y es nulo
			end
		end
	end #end 



	def []= (i,j,nvalor) #setter
		if (i,j <= @filas,@columnas)
			ind =0
			index=0
			while ind<N #iteramos en los elementos no nulos de la matriz dispersa
			
				if (i,j == @vfil,@vcol && nvalor != 0)
					@vvalor == nvalor  #si encontramos que la matriz tiene esa posicion simplemente almacenamos el nuevo valor
					return
					
				else if (i,j == @vfil,@vcol && nvalor = 0) #si el valor a almacenar en un elemento antes nonulo
					velementos = Array.new((@filas*@columnas) )	#debemos crear una nueva matriz con un elemento no nulo nuevo
					
					x,y = 0
					while x < @filas
						while y < @columnas
							if (x,y == i,j)
								velementos[index] = nvalor #almacena el nuevo valor para la nueva matriz cero en este caso
							else
								velementos[index] = self[x,y] #almacena el re4sto de valores que no cambian
							end
							index += 1
						end
					end
					
					self = MatrizDispersa.new (@filas,@columnas, velementos)
					return
				end
				ind += 1
			end
			
			#si no se encuentra la posicion debemos crear una nueva matriz para que el vector aumente una posicion
			x,y = 0
			while x < @filas
				while y < @columnas
					if (x,y == i,j)
						velementos[index] = nvalor #almacena el nuevo valor para la nueva matriz
					else
						velementos[index] = self[x,y] #almacena el re4sto de valores que no cambian
					end
					index += 1
				end
			end
			self = MatrizDispersa.new(@filas,@columnas, velementos)
		end
	end
	
end#end class
       

