namespace :import do

  desc 'import existing ssh config'
  task :config => :environment do
    include ApplicationHelper
    File.open(settings['imports']['file']) do |f|
      f.each_line do |line|
        if line.downcase.match(/host\ /)
          unless @server.nil?
            @server.save!
            puts "ADDED SERVER >> #{@server.host}"
          end
          @server = Server.new(
            :host => line.downcase.gsub(/host/, '').strip
          )
        elsif line.downcase.match(/hostname\ /)
          @server.host_name = line.downcase.gsub(/hostname/, '').strip
        elsif line.downcase.match(/user\ /)
          @server.user = line.downcase.gsub(/user/, '').strip
        elsif line.downcase.match(/port\ /)
          @server.port = line.downcase.gsub(/port/, '').strip
        end
      end
    end
  end

end
