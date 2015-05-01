default['web_application']['user'] = 'web_admin'
default['web_application']['group'] = 'web_admin'

default['web_application']['name'] = 'customers'
default['web_application']['config'] = 'customers.conf'

default['apache']['docroot_dir'] = '/srv/apache/customers'

default['web_application']['passwords']['secret_path'] = '/tmp/encrypted_data_bag_secret'

default['web_application']['database']['dbname'] = 'products'
default['web_application']['database']['host'] = '127.0.0.1'
default['web_application']['database']['username'] = 'root'

default['web_application']['database']['app']['username'] = 'db_admin'

default['web_application']['database']['seed_file'] ='/tmp/create-tables.sql'
