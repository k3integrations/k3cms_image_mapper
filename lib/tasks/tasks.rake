namespace :k3cms do
  namespace :image_mapper do
    desc "Install k3cms_image_mapper"
    task :install => [:copy_public] do
    end
    
    desc "Copy public files"
    task :copy_public do
      K3cms::FileUtils.copy_or_symlink_files_from_gem K3cms::ImageMapper, 'public/**/*'
    end
  end
end
