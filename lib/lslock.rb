require 'logger'

LOG = Logger.new(STDOUT)

class Lslock
  def self.run(path)
    list(path)
  end
  
  def self.list(path)
    # I'm not sure if I need to have this class share the lock info yet...
    @locks = Hash.new
    LOG.info "Known processes in #{path}:"
    # For all entries in path
    Dir.entries(path).each do |l|
      # Don't care about dot dirs
      unless l == '.' || l == '..'
        # Read the file and print it to stdout 
        File.open("#{path}/#{l}", 'r') do |f|
          LOG.info "Process #{path}/#{l}: #{f.read}"
          # populate the locks hash, ensure it's an instance var so I can expose it later as an API
          @locks["#{path}/#{l}"] = f.read
        end
      end
    end
  end
end

Lslock.run('/tmp/test')
