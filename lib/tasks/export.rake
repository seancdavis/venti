namespace :export do

  desc 'write files'
  task :data => :environment do
    data_dir = "#{Rails.root}/lib/export"
    FileUtils.mkdir(data_dir) unless File.exist?(data_dir)

    master_file_contents = ''
    Account.all.includes(:servers).each do |account|
      file_contents = ''
      file = "#{data_dir}/config_#{account.name.underscore.downcase}"
      account.servers.each do |server|
        file_contents += template "server", server
      end
      File.open(file, 'w') { |file| file.write(file_contents) }
      master_file_contents += file_contents
    end
    File.open("#{data_dir}/config", 'w') { |file| file.write(master_file_contents) }

  end

  def template(name, server)
    require 'erb'
    @server = server
    renderer = ERB.new(File.read("#{Rails.root}/lib/templates/#{name}.erb"), 0, '<>')
    renderer.result
  end

end
