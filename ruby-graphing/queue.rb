module ATD
 module Utils
 class Queue 
   
   def initialize(depth=100)
     @store = Array.new
     @max= depth
   end

   def dequeue
    empty? ? nil : @store.pop
   end

   def enqueue val
     if not full?
       @store.unshift(val)
       self
     else
      nil
     end
   end

   def size
     @store.size
   end


   def full?
    size >= @max
   end

   def empty?
     0 == size
   end

 end

 end
end
