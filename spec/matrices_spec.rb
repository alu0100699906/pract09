
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
		@mp = Matriz.constructor(3,3,[1,2,3,0,0,0,0,0,4])
		@mq = Matriz.constructor(3,3,[2,4,0,0,0,0,2,0,0])
		@mr = Matriz.constructor(3,3,[3,6,3,0,0,0,2,0,4])

		@fa = Fraccion.new(1,2)
		@fb = Fraccion.new(3,4)
		@fc = Fraccion.new(5,6)
		@fd = Fraccion.new(7,8)
		@ra = Fraccion.new(11,8)
		@ro = Fraccion.new(19,12)
		@rb = Fraccion.new(33,32)
		@rc = Fraccion.new(55,48)
		@rd = Fraccion.new(89,64)

		@a = Matriz.constructor(2,2, [@fa,@fb,@fc,@fd])
		@b = Matriz.constructor(2,2,[@fd, @fc, @fb, @fa])
		@c = Matriz.constructor(2,2,[@ra,@ro,@ro,@ra])

		
	end

	 describe "# pruebas " do
		
		it "instanciacion de un racional" do
			@fa = Fraccion.new(1,2)		
			@fa.numerador.should == 1
			@fa.denominador.should == 2
		end

                it "suma de matrices con fracciones" do
			(@a + @b).should == @c
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
			(@mp + @mq).should == @mr
		end
		
		it "resta" do
			(@md -@mz).should eq(@ma)
			(@mo - @mg).should eq(@mb)
		end
		it " getter y setter"do
			@mz[0,0].should == 1
			@ma[0,1]= 2 
			@ma[0,1].should == 2
			
			@mc[0,0].should == 8
			@mc[1,2]= 5
			@mq[0,1].should == 4
		
			@mb[1,2].should == 1
			@mb[0,0]= 5
			@mb[0,0].should == 5
			


		end
	
	end
	
end

