module ATD
  module Utils
   # Matrix (NxN Array) representing the edges in a Graph.  
   # 
   # NOTE: Don't go hogwild with the size.
   #
   class AdjMatrix
      attr_reader :size
      def initialize (size)
        @size = size
        @matrix = Array.new(size) {Array.new(size)}
      end
      
      def index(x, y)
				@matrix[x][y]
			end

      def add_unidirectional_edge (node1,node2,cost=1)
         @matrix[node1.id,node2.id]= cost
      end
  
      def add_bidirectional_edge(node1,node2,cost =1)
        add_uniderctional_edge(node1,node2,cost)
        add_uniderctional_edge(node2,node1,cost)
      end
      
      def add_unidirectional_edges (node1,nodes, cost=1)
				nodes.each do |node|				
         add_unidirectional_edge(node1,node,cost)
				end
      end
  
      def remove_unidirectional_edge (node1,node21)
         @matrix[node1.id,node2.id]=nil
      end

      def remove_bidirectional_edge(node1,node2)
        add_uniderctional_edge(node1,node2)
        add_uniderctional_edge(node2,node1)
      end



  
   end


  end
end
