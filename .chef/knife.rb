current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "leozh"
client_key               "#{current_dir}/leozh.pem"
validation_client_name   "leo-aws-validator"
validation_key           "#{current_dir}/leo-aws-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/leo-aws"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:aws_access_key_id] = "#{ENV['EC2_ACCESS_KEY']}"
knife[:aws_secret_access_key] = "#{ENV['EC2_SECRET_KEY']}"
knife[:aws_ssh_key_id] = "leozh"
