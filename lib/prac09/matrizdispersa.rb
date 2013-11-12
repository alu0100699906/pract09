class MatrizDispersa < Matriz

	def initialize (filas, columnas, N, *tuplas) 	
	#N es el numero de elementos no nulos
	#tuplas trataremos los datos asi: (3,0,1),(1,2,4),(5,4,6)...(2,6,7),(2,8,6)
	# donde agrupamos de tres en tres,(v,i,j)vvalores,vfil, vcol

		super(filas, columnas)

		@n_nonulo = N
	
		@vvalores = Array.new(N)
		@vfil = Array.new(N)
		@vcol = Array.new(N)
	
		ind = 0
		while (ind < (3*N))
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

	def [](x,y)
		while (i<N)
			if(@vfil[i]==x && @vcol[i]==y)
				@vvalores[i]
			end
		end
	end #end []



	def []= (i,j,nvalor)
		* tuplas = Array.new(((3*@N)+3))
		
		ind =0
		index=0
		while ind<N #iteramos en los elementos no nulos de la matriz dispersa
		
			if (i,j == @vfil,@vcol) do
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
		self = MatrizDispersa.new(@filas,@columnas,((3*@N)+3),tuplas)
	end



       ##repasar implemeentacion#####
	def == (object)

		if ((object.instance_of?(MatrizDispersa) == true) && (@filas == object.filas) && (@columnas == object.columnas))#tambien hay que mirar la longitud

			m_res=MatrizDispersa.new(@filas,@columnas)
		i=0
		while i<@n_nonulo		
			j = 0
			while j<object.n_nonulo
				if (@vfil[i],@vcol[i]==object.vfil[j],object.vcol[j])
					m_res[]
				end
			end
		end
	end#end ==

##quitar comentarios raros para que travis funcione

end#end class
       
