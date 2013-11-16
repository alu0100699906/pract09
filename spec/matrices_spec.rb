
require 'prac09.rb'


describe Matriz do

	before (:each) do
	
		@ma = Matriz.constructor(2,2,[1,1,2,2])
		@mz = Matriz.constructor(2,2,[1,1,2,2])
		@md = Matriz.constructor(2,2,[2,2,4,4])
                @mc = Matriz.constructor(3,3,[8,8,4,5,4,7,1,2,9])
		@mb = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mg = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mo = Matriz.constructor(3,3,[0,0,0,0,0,2,0,0,0])
		@fa = Fraccion.new(1,2)
	end

	 describe "# pruebas " do
		
		it "instanciacion de un racional" do		
			@fa.numerador.should == 1
			@fa.denominador.should == 2
		end


        	it "#comprobacion de clases" do
			@mb.instance_of?(MatrizDispersa)
			@ma.instance_of?(MatrizDensa)
		end

		it " igualdad densa "do
			@ma.should == @mz	
		end

		it " igualdad dispersa "do
			@mb.should == @mg
		end
	
		it " suma " do
			(@ma + @mz).should == @md
			(@mg + @mb).should == @mo
		end
	
	end
	
end

