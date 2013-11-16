
require 'prac09.rb'


describe Matriz do
	it "# instanciacion de una matriz" do
		@a = MatrizDensa.new(2,2,[1,1,2,2])
                @b = MatrizDispersa.new(3,3,[8,8,0,0,0,0,0,0,0])
	end
        it "#comprobacion de clases" do
		@b.instance_of?(MatrizDispersa)
		@a.instance_of?(MatrizDensa)
	end
end

