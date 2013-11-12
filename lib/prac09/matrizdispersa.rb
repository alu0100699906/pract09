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


       def []=(x,y,valor)
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
       
