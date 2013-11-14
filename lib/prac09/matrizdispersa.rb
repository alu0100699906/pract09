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
		tuplas = Array.new(((3*@n_nonulo)+3))
	
		ind =0
		index=0
		while ind<N #iteramos en los elementos no nulos de la matriz dispersa
		
			if (i,j == @vfil,@vcol)
				@vvalor==nvalor  #si encontramos que la matriz tiene esa posicion simplemente almacenamos el nuevo valor
				return
			end
			
			#almacenamos las tuplas por si necesitamos crear una nueva matriz
			tuplas[index] = @vvalor[ind]
			tuplas[index+1] = @vfil[ind]
			tuplas[index+2] = @vcol[ind]
			index += 3
			#
			
			ind += 1
		end
		
		#almacenamos por ultimo el valor que no podiamos insertar en esta matriz
		tuplas[index] = nvalor
		tuplas[index+1] = i
		tuplas[index+2] = j
		#
		
		#si no se encuentra la posicion debemos crear una nueva matriz para que el vector aumente una posicion
		self = MatrizDispersa.new(@filas,@columnas,((3*@n_nonulo)+3),tuplas)
	end

end#end class
       
