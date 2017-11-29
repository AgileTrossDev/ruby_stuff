module ATD
 module Utils
 class Stack
   
   def initialize(depth=100)
     @store = Array.new
     @max= depth
   end

   def pop
     puts @store.size
      (empty? ? nil : @store.pop)
   end

   def push val
     if not full?
       @store.push(val)
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
     puts "Empty #{0 == size}"
     0 == size
   end
   
   
   def disp
    puts "Displaying values of stack..."
    @store.each_with_index do |v,i|
      puts"#{i}: #{v}"     
    end     
   end

 end

 end
end
