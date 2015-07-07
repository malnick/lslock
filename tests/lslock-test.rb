class LslockTest
  def self.fork(procs)
    procs.times do |f|
      Process.fork do  
        File.open("/tmp/test/#{Process.pid}.lock", 'wb') do |p|
          p.write Process.pid 
        end
      end
    end
  end
end

LslockTest.fork(3)
