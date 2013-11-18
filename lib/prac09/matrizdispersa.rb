
class MatrizDispersa < Matriz

	def initialize(filas, columnas, velementos)
    		super(filas, columnas)
                @vvalores= Array.new 
                @vfil= Array.new
                @vcol = Array.new

                longitud=(@filas*@columnas)
		i=0
		while(i<longitud)

      			if(velementos[i]!=0)

        		@vvalores<< (velementos[i])
        		@vfil << (i/@columnas)
       			@vcol<< (i%@columnas)
			end
			i=i+1
		end
	end


        def [](f,c)
		no_nulo=@vvalores.size
		i=0
		while(i < no_nulo)

      			if (@vfil[i] == f && @vcol[i] == c)
        			return @vvalores[i]
       		        end
			i=i+1
     		end
     		return 0 
  	end


end
