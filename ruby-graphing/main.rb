
require_relative 'stack'
require_relative 'dfs'
require_relative 'adj_matrix'

puts "Main Execution started..."

puts "\n\nStack Stuff...."
stack = ATD::Utils::Stack.new(5)
puts "Stack Size #{stack.size}"
puts stack.push(1).nil? ? "Stack Overflow" :"Good"
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)

puts stack.push(6).nil? ? "Stack Overflow" :"Good"

1.upto(6) do 
  puts  stack.pop.nil? ? "Bab pop!" : "Good Pop"
end



puts "\n\nDepth First Search Stuff...."


# Build Matrix
adj_matrix = ATD::Utils::AdjMatrix.new(6)

# Build the nodes
nodes = []
["A","B","C","D","E","F"]. each do |v|
  nodes.push ATD::Utils::Node.build v
end

# Create edges
adj_matrix.add_unidirectional_edges nodes[0],[nodes[1],nodes[2],nodes[3]]
adj_matrix.add_unidirectional_edge nodes[1],nodes[4]
adj_matrix.add_unidirectional_edge nodes[2],nodes[5]
adj_matrix.add_unidirectional_edge nodes[3],nodes[5]


result_stack = ATD::Utils::dfs adj_matrix, nodes[0],nodes[5]
result_stack.disp


puts "Main Execution complete!"
