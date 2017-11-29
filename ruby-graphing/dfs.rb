# Depth First Search

require_relative 'node'
require_relative 'stack'

module ATD
  module Utils
    module_function
    def dfs(edge_matrix, source, terminus)
      # Assumes graph is a array of arrays and that both source
      # and terminus are both nodes
      node_stack = Stack.new
      node_stack.push source
      
      puts "Searching for path from #{source.id} to #{terminus.id}"

      loop do
        puts "Looping..."
        curr_node = node_stack.pop
        if curr_node == nil
          puts "Current Node is nil"
          break
        elsif curr_node.equal? (terminus)
          puts "Path found"
          break;
        else
          puts curr_node.class
          puts curr_node.id
        end

        #children = (0..edge_matrix.size-1).select do |i|
        #  puts "#{i} #{i.class} #{curr_node.class}"
        #  !(edge_matrix.index(curr_node.id,i).nil?) 
        #end
        
        0.upto(edge_matrix.size-1) do |child|
          if not (edge_matrix.index(curr_node.id,child)).nil?
            puts "Stacking #{curr_node.id} #{child}"
            node_stack.push( (edge_matrix.index(curr_node.id,child)))
          end
        end        
      end #loop52.63+
      .
      puts "DFS Done #{node_stack.class} #{node_stack.size}"
      node_stack
    end # DFS
  end # Utils
end # ATD
