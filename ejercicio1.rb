class Table
	attr_accessor :name, :profit
    def initialize(name, *profit)
    	 
       @name = name
       @profit = profit.map(&:to_i)
 end
#Crear un método que permita leer el archivo e instanciar una mesa por línea del
#archivo.
 def self.create_tables
 	tables = []
 	file = File.open('casino.txt', 'r')
 	lines = file.readlines
 	file.close
	lines.each do |line|
	new_line = line.split(', ')	
	tables << Table.new(new_line.shift, *new_line)
  end
   tables
 end
 #Conocer el mayor valor recaudado, y a que mesa y día corresponde.
 def self.max_profit
 	tables = create_tables
 	best_tables = {}
 	tables.each_with_index do |table,day|
 	best_tables[table.name] = [table.profit.max, day+1]
 end 
   print best_tables.max_by{|k,v| v[0]}	
 end
#Calcular el promedio total de lo recaudado por todas las mesas en todos los
#dias
def Table.profit_average
	tables = create_tables
	results = []
	tables.each do |table|
		results << table.profit
  end
  results.flatten!.inject{|sum,el| sum + el } / results.length
end

end
 
  
   Table.max_profit
   puts"---------------------------"
   puts Table.profit_average