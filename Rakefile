require 'rake'

task :default => [:install_vim, :install_zsh, :install_vcs, :install_irbrc, :update_vim_bundles ]

task :install_vim do |t|
  vimdir = File.expand_path("~/.vim")
  homedir = File.expand_path("~")
  puts "copying vim files"
  ["vimrc","gvimrc"].each {|v| FileUtils.cp("./#{v}","#{homedir}/.#{v}") }
  FileUtils.cp_r('./_vim/.',vimdir)
end

task :install_vcs do |t|
  puts "Installing git/hg configs"
  homedir = File.expand_path("~")
  ["gitconfig","hgrc"].each {|vcfile| FileUtils.cp("./#{vcfile}","#{homedir}/.#{vcfile}") }
end

task :install_zsh do |t|
  puts "installing zsh stuff"
  homedir = File.expand_path("~")
  mkdir("#{homedir}/.zsh") unless File.exists?("#{homedir}/.zsh")

  ["zshrc","zlogin","zprofile", "aliases","screenrc", "inputrc", "gemrc","dircolors"].each { |zfile| FileUtils.cp(zfile,"#{homedir}/.#{zfile}") }
end

task :install_irbrc do |t|
  puts "installing irbrc"
  homedir = File.expand_path("~")
  FileUtils.cp("./irbrc","#{homedir}/.irbrc")
end

task :update_vim_bundles do |t|
  #http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
  git_bundles = [
    "git://github.com/tpope/vim-fugitive.git",
    "git://github.com/tpope/vim-rails.git",
    "git://github.com/tpope/vim-surround.git",
    "git://github.com/altercation/vim-colors-solarized",
    "git://git.wincent.com/command-t.git",
    "git://github.com/kchmck/vim-coffee-script.git"
  ]
  rake_dir = Dir.getwd
  bundles_dir = File.expand_path("~/.vim/bundle")
  mkdir(bundles_dir) unless File.exists?(bundles_dir)

  FileUtils.cd(bundles_dir)

  puts "Trashing everything (lookout!)"
  Dir["*"].each {|d| FileUtils.rm_rf d }

  git_bundles.each do |url|
    dir = url.split('/').last.sub(/\.git$/, '')
    puts "  Unpacking #{url} into #{dir}"
    `git clone #{url} #{dir}`
    FileUtils.rm_rf(File.join(dir, ".git"))
  end

  #build command-t stuff
  FileUtils.cd(bundles_dir + "/command-t")
  `rake make`

  puts "copying local bundles over"
  FileUtils.cp_r("#{rake_dir}/_vim_bundles/.", bundles_dir)
end
