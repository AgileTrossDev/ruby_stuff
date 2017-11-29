require 'thread'
require 'timeout'

def sleepy t
  puts "THREAD: #{Thread.current.object_id} IS SLEEPING FOR #{t}..."
  sleep(t)
  puts "THREAD: #{Thread.current.object_id} IS COMPLETE AFTER SLEEPING #{t}..."
end


def watch thread, limit
  puts "THREAD: #{Thread.current.object_id} IS JOINING #{thread.object_id}..."
  thread.join(limit)
  puts "THREAD: #{Thread.current.object_id} HAS BEEN AWOKEN AFTER JOINING #{thread.object_id}..."
end

def disp thread_array
  puts "\nThread status..."
  thread_array.each do |a|
    puts "THREAD #{a.object_id}: #{a.status}"
  end
  puts "-----\n"
end


def act

  # Holds threads in experiment
  array = []
  
  # Start a thread will remain active
  thread1 = Thread.new {sleepy(60)}
  array.push(thread1)
  sleep(1)  
  disp array
  
  # Start a thread that jons the active thread
  array.push(Thread.new {watch(thread1, 60)})
  sleep(3)
  disp array
  
  
  puts "Waking joined thread..."
  lastThread =  array.last
  disp array
  lastThread.wakeup
  sleep(2)
  disp array
  
  puts "Starting Watcher again.."
  array.push(Thread.new {watch(thread1, 60)})
  disp array
  sleep(2)
  disp array
end

def block_me
  puts "\n\nBLOCK ME ENTERED - #{Thread.current.object_id}\n\n"
  with_mutex {sleep 30}
  puts "\n\nBLOCK ME LEAVING - #{Thread.current.object_id}\n\n"
end


################################################################################################  
# Mutex check
################################################################################################
def with_mutex
  @thread_queue_mutex.synchronize {
    puts "In mutex"
    a= yield
    puts "Leaving mutex"
    a
  }
end


def disp_thread_status t
  puts "#{t.object_id} #{t.status.class} #{t.status}"
end

@thread_queue_mutex= Mutex.new  # NOTE: Transcations should be short and sweet

def act2
  
  
  puts "Launching Threads...."
  a= Thread.new {block_me}
  sleep(1)
  b= Thread.new {block_me}
  puts a.class
  puts b.class
  disp_thread_status a
  disp_thread_status b
  
  sleep(10)
  puts "WAKING UP..."
  a.wakeup
  sleep(1)
  
  puts "Final staus"
  disp_thread_status a
  disp_thread_status b
end


 