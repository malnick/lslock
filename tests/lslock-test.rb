class LslockTest
  def self.fork(procs, time)
    _procs = procs.to_i 
    _time = time.to_i
    _procs.times do |f|
      Process.fork do  
        new_proc(_time)
      end
    end
  end

  def self.new_proc(time)
    File.open("/tmp/test/#{Process.pid}.lock", 'wb') do |p|
      p.write Process.pid 
    end
    sleep time
    File.rename("/tmp/test/#{Process.pid}.lock", "/tmp/test/#{Process.pid}.expired")
  end
end

LslockTest.fork(ARGV[0], ARGV[1])
