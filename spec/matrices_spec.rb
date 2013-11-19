
require 'prac09.rb'

describe Matriz do

	before (:each) do
	
		@ma = Matriz.constructor(2,2,[1,1,2,2])
		@mz = Matriz.constructor(2,2,[1,1,2,2])
		@md = Matriz.constructor(2,2,[2,2,4,4])
		@mc = Matriz.constructor(3,3,[8,8,4,5,4,7,1,2,9]) 
		@msum2 = Matriz.constructor(2,2,[3,1,2,2])

		@mb = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mg = Matriz.constructor(3,3,[0,0,0,0,0,1,0,0,0])
		@mo = Matriz.constructor(3,3,[0,0,0,0,0,2,0,0,0])
		@mp = Matriz.constructor(3,3,[1,2,3,0,0,0,0,0,4])
		@mq = Matriz.constructor(3,3,[2,4,0,0,0,0,2,0,0])
		@mr = Matriz.constructor(3,3,[3,6,3,0,0,0,2,0,4])
		@mul = Matriz.constructor(3,3,[6,12,18,12,24,36,18,36,54])

		@fa = Fraccion.new(1,2)
		@fb = Fraccion.new(3,4)
		@fc = Fraccion.new(5,6)
		@fd = Fraccion.new(7,8)
		@ra = Fraccion.new(11,8)
		@ro = Fraccion.new(19,12)
		@rb = Fraccion.new(33,32)
		@rc = Fraccion.new(55,48)
		@rd = Fraccion.new(89,64)

		@sa = Fraccion.new(5,2)
		@sb = Fraccion.new(11,4)
		@sc = Fraccion.new(29,6)
		@sd = Fraccion.new(39,8)
		@sum1 = Matriz.constructor(2,2,[@sa,@fb,@fc,@fd])
		@sum = Matriz.constructor(2,2, [@sa,@sb,@sc,@sd])
		@dis = Matriz.constructor(2,2, [2,0,0,0])
		@a = Matriz.constructor(2,2, [@fa,@fb,@fc,@fd])
		@b = Matriz.constructor(2,2,[@fd, @fc, @fb, @fa])
		@c = Matriz.constructor(2,2,[@ra,@ro,@ro,@ra])
		@d = Matriz.constructor(2,2,[@ra,@rb,@rc,@rd])
		@e = Matriz.constructor(2,2,[@fd,@rb,@rc,@rd])

		@pro1 = Matriz.constructor(3,3,[1,1,1,2,2,2,3,3,3])
                @pro2 = Matriz.constructor(3,3,[1,2,3,1,2,3,1,2,3])
                @pro3 = Matriz.constructor(3,3,[3,6,9,6,12,18,9,18,27])

		@multip = Matriz.constructor(3,2,[2,3,0,1,0,3])
		@multip1 = Matriz.constructor(2,4,[0,1,0,0,7,0,2,0])#dispersa
		@multip2 = Matriz.constructor(3,4,[21,2,6,0,7,0,2,0,21,0,6,0])
		
		@l1=Matriz.constructor(2,2,[0,0,0,1])
		@l2=Matriz.constructor(2,2,[0,1,0,0])
		@l3=Matriz.constructor(2,2,[0,0,0,0])

		@l4=Matriz.constructor(3,3,[0,1,2,1,0,0,0,0,0])
		@l5=Matriz.constructor(3,3,[2,0,2,2,0,0,0,0,0])
		@l6=Matriz.constructor(3,3,[2,0,0,2,0,2,0,0,0])
	
		@fff=Fraccion.new(4,3)
		@ff1=Fraccion.new(13,8)
		@ff2=Fraccion.new(8,3)
		@ff3=Fraccion.new(13,4)
		@resultado = Matriz.constructor(2,2,[@fff,@ff1,@ff2,@ff3])

		@ff4=Fraccion.new(0,4)
		@ff5=Fraccion.new(3,4)
		@ff6=Fraccion.new(0,24)
		@ff7=Fraccion.new(7,8)
		@resultado2 = Matriz.constructor(2,2,[@ff4,@ff5,@ff6,@ff7])
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
			@dis.instance_of?(MatrizDispersa)
		end

		it " igualdad densa "do
			@ma.should == @mz	
		end

		it " igualdad dispersa "do
			@mb.should == @mg
		end
	
		it " suma " do
			(@ma + @mz).should == @md #suma densas
			(@mg + @mb).should == @mo #suma dispersas
			(@mp + @mq).should == @mr #suma dispersas
			(@a + @md).should == @sum #suma racional con densa	
			(@a + @dis).should == @sum1 #suma racional con dispersa
			(@dis+ @a).should == @sum1 #suma dispersa con racional
			(@ma + @dis).should == @msum2 #suma dispersa con densa
		end
		
		it "resta" do
			(@md -@mz).should eq(@ma)
			(@mo - @mg).should eq(@mb)
		end

		 it " producto "do
			(2*@pro3).should == @mul
			(@ma * @a).should == @resultado  
			(@a * @l1).should == @resultado2
                        ( @a * @a ).should == @e #multiplica 2 racionales
                        (@pro1 * @pro2).should == @pro3
			(@multip * @multip1).should ==(@multip2) #multiplica densa con dispersa
			(@l1*@l2).should ==@l3 #multiplica dispersas
			(@l4*@l5).should ==@l6 #multiplica dispersas
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
		it " maximo y minimo"do
			@mq.max.should == 4
			@md.max.should == 4
			@mr.max.should == 6

		end
	
	end
	
end

