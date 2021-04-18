lock '3.16.0'

set :application, 'recipe-app'

set :repo_url,  'git@github.com:hm0913/recipe-app.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/habumami/.ssh/habumaimi.pem'] 

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# credentials.yml.enc用のシンボリックリンクを追加
<<<<<<< Updated upstream
set :linked_files, %w{ config/credentials.yml.enc }
=======
set :linked_files, %w{ config/master.key }
>>>>>>> Stashed changes

# 元々記述されていた after 「'deploy:publishing', 'deploy:restart'」以下を削除して、次のように書き換え

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

<<<<<<< Updated upstream
  desc 'upload credentials.yml.enc'
=======
  desc 'upload master.key'
>>>>>>> Stashed changes
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
<<<<<<< Updated upstream
      upload!('config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc")
=======
      upload!('config/master.key', "#{shared_path}/config/master.key")
>>>>>>> Stashed changes
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end