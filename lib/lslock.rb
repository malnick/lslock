require 'logger'

LOG = Logger.new(STDOUT)

class Lslock
  def self.run(path)
    list(path)
  end
  
  def self.list(path)
    LOG.info "Known processes in #{path}:"
    Dir.entries(path).each do |l|
      unless l == '.' || l == '..' 
        LOG.info "Parsing #{l}"
        File.open("#{path}/#{l}", 'r') do |f|
          LOG.info "Process #{path}/#{l}: #{f.read}"
        end
      end
    end
  end
end

Lslock.run('/tmp/test')
