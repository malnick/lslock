class LslockTest
  def self.fork(procs, time)
    procs.times do |f|
      Process.fork do  
        new_proc(time)
      end
    end
  end

  def self.new_proc(time)
    File.open("/tmp/test/#{Process.pid}.lock", 'wb') do |p|
      p.write Process.pid 
    end
    sleep time
  end
end

LslockTest.fork(3, 10000)
