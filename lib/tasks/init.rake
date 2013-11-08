namespace :staging_protection do
  desc "Create default configuration"
  task :initialize do
    path = "config/initializers/staging_protection.rb"
    file = File.open("#{Rails.root}/#{path}","w")
    text = <<-TEXT
StagingProtection.config do |config|
  # Password should be changed
  config.password = '123456'

  # Token should be changed
  config.token = '1234567819287321256789'

  # Default error message can be overriden
  # config.message = 'you are not authorized to access this page.'

  # Default environment is staging, but it you can use any others.
  # config.environment = 'development'
end
    TEXT
    file << text
    file.close

    puts "Created config for staging_protection gem.\nCheck it out here! #{path}\n"
  end
end
