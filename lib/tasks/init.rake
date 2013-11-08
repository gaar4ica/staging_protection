namespace :staging_protection do
  desc "Create default configuration"
  task :initialize do
    path = "config/initializers/staging_protection.rb"
    file = File.open("#{Rails.root}/#{path}","w")

    chars = [*('A'..'Z'), *('a'..'z'), *(0..9)]
    password = (0..15).map {chars.sample}.join
    token = (0..25).map {chars.sample}.join

    text = <<-TEXT
StagingProtection.config do |config|
  # Password generated for your app can be changed
  config.password = '#{password}'

  # Also you can change token
  config.token = '#{token}'

  # Default error message can be overriden
  # config.message = 'you are not authorized to access this page.'

  # Default environment is staging, but it you can use any others.
  # config.environment = :development
end
    TEXT
    file << text
    file.close

    puts "Created config for staging_protection gem.\nCheck it out here! #{path}\n"
  end
end
