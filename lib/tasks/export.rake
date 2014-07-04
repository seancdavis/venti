namespace :export do

  desc 'write files'
  task :data => :environment do
    data_dir = "#{Rails.root}/lib/export"
    FileUtils.mkdir(data_dir) unless File.exist?(data_dir)

    Account.all.includes(:servers).each do |account|
      file_contents = ''
      account.servers.each do |server|
        file_contents += template "server", server
      end
      puts file_contents
    end

  end

  def template(name, server)
    require 'erb'
    @server = server
    renderer = ERB.new(File.read("#{Rails.root}/lib/templates/#{name}.erb"), 0, '<>')
    renderer.result
  end

end
