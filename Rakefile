require 'rake'

task :default => [:install_vim, :install_shell, :install_irbrc, :install_tmux, :update_vim_bundles, :install_postgres]

desc 'Install Vim Configs'
task :install_vim do |t|
  vimdir = File.expand_path("~/.vim")
  homedir = File.expand_path("~")
  puts "copying vim files"
  ["vimrc","gvimrc"].each {|v| FileUtils.cp("./#{v}","#{homedir}/.#{v}") }
  FileUtils.cp_r('./_vim/.',vimdir)
end

desc 'Install VCS type stuff'
task :install_vcs do |t|
    puts "Installing git/hg configs"
      homedir = File.expand_path("~")
        ["gitconfig"].each {|vcfile| FileUtils.cp("./#{vcfile}","#{homedir}/.#{vcfile}") }
end

desc 'Install shell related stuff'
task :install_shell do |t|
  puts "installing zsh stuff"
  homedir = File.expand_path("~")
  dot_zsh =File.join(homedir,".zsh")
  mkdir(dot_zsh) unless File.exists?(dot_zsh)

  ["zshrc","aliases","screenrc", "inputrc", "gemrc","dircolors", "telnetrc"].each { |zfile| FileUtils.cp(zfile,"#{homedir}/.#{zfile}") }
end

desc 'Install postgres Related Stuff'
task :install_postgres do |t|
  puts "installing postgres stuff.."
  homedir = File.expand_path("~")
  dot_psql = File.join(homedir,".psql")
  mkdir(dot_psql) unless File.exists?(dot_psql)
  FileUtils.cp("./psqlrc",File.join(homedir,".psqlrc"))
end

desc 'Install IRB Related Stuff'
task :install_irbrc do |t|
  puts "installing irbrc"
  homedir = File.expand_path("~")
  FileUtils.cp("./irbrc","#{homedir}/.irbrc")
end

desc 'install tmux stuff'
task :install_tmux do |t|
  puts "installing tmux"
  homedir = File.expand_path("~")
  FileUtils.cp("./tmux.conf", "#{homedir}/.tmux.conf")
end

desc 'Update my vim bundles'
task :update_vim_bundles do |t|
  #http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
  git_bundles = [
    "git://github.com/tpope/vim-fugitive.git",
    "git://github.com/tpope/vim-rails.git",
    "git://github.com/tpope/vim-surround.git",
    "git://github.com/altercation/vim-colors-solarized",
    "git://github.com/kchmck/vim-coffee-script.git",
    "git://github.com/tsaleh/vim-align.git",
    "git://github.com/tpope/vim-endwise.git",
    "git://github.com/tpope/vim-vividchalk.git",
    "git://github.com/tpope/vim-unimpaired.git",
    "git://github.com/rking/ag.vim",
    "git://github.com/vim-ruby/vim-ruby.git",
    "git://github.com/tpope/vim-bundler.git",
    "git://github.com/vim-scripts/dbext.vim",
    "git://github.com/w0ng/vim-hybrid.git",
    "git://github.com/bling/vim-airline",
    "git://github.com/airblade/vim-gitgutter.git"
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

end
