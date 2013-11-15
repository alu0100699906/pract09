
require 'prac09/matriz.rb'
require 'prac09/matrizdispersa.rb'
require 'prac09/matrizdensa.rb'


describe Matriz do
	it "# instanciacion de una matriz" do
		@a = Matriz.new(2,2,[1,1,2,2])
                @b = crearmatriz(3,3,[0,0,0,3,6,0,1,0,0])
		@b.class.should eq(MatrizDispersa)
	end
end

