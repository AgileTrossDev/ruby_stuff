module ATD
  module Utils
   class Node
    private_class_method :new
    attr_reader :value,:id
    
    def self.build val
      @@node_count ||= 0
      ret = new(val,@@node_count)
      @@node_count +=1
      ret
    end
    
    def initialize val, id
       @value = val
       @id = id
    end

    def equal?(node) 
     @value == node.value
    end
  
    def disp
      puts "NODE #{@id}: #{@value}"
    end

   end

  end

end
