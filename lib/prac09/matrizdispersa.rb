class MatrizDispersa < Matriz
    
	def initialize (filas, columnas, *velementos) 	
		
		super(filas, columnas)
		
		@vvalores = Array.new
		@vfil = Array.new
		@vcol = Array.new
	        longitud=@filas*@columnas

 
		ind = 0
		while (ind < longitud)
			if(velementos[ind]!=0)

				@vvalores=velementos[ind]
				@vfil=(ind/@columnas)
				@vcol=(ind%@columnas)

				ind =ind+1
			end
		end

	end#end initialize


	def [](x,y) #getter
		ind = 0
		while (ind < @vvalores.size)
			if(@vfil[ind] == x && @vcol[ind] == y) 	#si encuentra la posicion 
				return @vvalores[ind][ind]					#retorna el valor almacenado en ella
			
				ind += 1
			else					#si no hay mas posiciones ocupadas
				return 0						#es que el elemento indice x y es nulo
			end
		end
	end #end 


	def []= (i,j,nvalor) #setter
		if (i<= @filas && j<=@columnas)
			ind =0
			index=0
			while ind< @vvalores.size #iteramos en los elementos no nulos de la matriz dispersa
			
				if (i == @vfil && j==@vcol && nvalor != 0)
					@vvalor == nvalor  #si encontramos que la matriz tiene esa posicion simplemente almacenamos el nuevo valor
					return
					
				else if (i == @vfil && j==@vcol && nvalor == 0) #si el valor a almacenar en un elemento antes nonulo
					velementos = Array.new((@filas*@columnas) )	#debemos crear una nueva matriz con un elemento no nulo nuevo
					
					x,y = 0
					while x < @filas
						while y < @columnas
							if (x == i && y==j)
								velementos[index] = nvalor #almacena el nuevo valor para la nueva matriz cero en este caso
							else
								velementos[index] = matri[x,y] #almacena el resto de valores que no cambian
							end
							index += 1
						end
					end
					
					matri = MatrizDispersa.new(@filas,@columnas, @velementos)
					return
				end
				ind += 1
			end
			
			#si no se encuentra la posicion debemos crear una nueva matriz para que el vector aumente una posicion
			x,y = 0
			while x < @filas
				while y < @columnas
					if (x== i && y==j)
						velementos[index] = nvalor #almacena el nuevo valor para la nueva matriz
					else
						velementos[index] = matri[x,y] #almacena el re4sto de valores que no cambian
					end
					index += 1
				end
			end
			matri = MatrizDispersa.new(@filas,@columnas, @velementos)
		end
	end
   end	
end#end class
       

