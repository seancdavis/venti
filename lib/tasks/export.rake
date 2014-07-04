namespace :export do

  desc 'write files'
  task :data => :environment do
    include ApplicationHelper
    data_dir = settings['exports']['dir']
    FileUtils.mkdir(data_dir) unless File.exist?(data_dir)

    master_file_contents = ''
    master_file = "#{data_dir}/config"
    Account.all.includes(:servers).each do |account|
      @account = account
      file_contents = template "server_comment"
      file = "#{data_dir}/config_#{account.name.underscore.downcase}"
      account.servers.each do |server|
        @server = server
        file_contents += template "server"
      end
      File.open(file, 'w') { |file| file.write(file_contents) }
      master_file_contents += file_contents
      puts "WROTE #{account.name} CONFIG >> #{file}"
    end
    File.open(master_file, 'w') { |file| file.write(master_file_contents) }
    puts "WROTE MASTER FILE >> #{master_file}"

  end

  def template(name)
    require 'erb'
    renderer = ERB.new(File.read("#{Rails.root}/lib/templates/#{name}.erb"), 0, '<>')
    renderer.result
  end

end
