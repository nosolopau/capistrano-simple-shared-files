namespace :simple_shared_files do

  desc 'Upload files and directories'
  task :upload do
    invoke 'simple_shared_files:upload:files'
    invoke 'simple_shared_files:upload:dirs'
  end

  namespace :upload do

    task :files do
      on roles :web do
        if fetch(:shared_files)
          fetch(:shared_files).each do |file|
            upload! file, "#{shared_path}/#{file}"
          end
        end  
      end
    end

    task :dirs do
      on roles :web do
        if fetch(:shared_dirs)
          fetch(:shared_dirs).each do |dir|
            upload! dir, "#{shared_path}/", recursive: true
          end
        end  
      end
    end
  end

  before 'simple_shared_files:upload', 'deploy:check:make_linked_dirs'
end
