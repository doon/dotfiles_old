require 'rake'
require 'fileutils'

task :default => [:install_vim, :install_shell, :install_irbrc, :install_tmux ]

desc 'Install Vim Configs'
task :install_vim do |t|
  homedir = File.expand_path "~"
  minpac = File.join homedir,".vim", "pack", "minpac", "opt"
  minpac_plug = File.join minpac, "minpac" 
	vimrc_src = File.join File.dirname(__FILE__), "vimrc"
	vimrc_dst = File.join homedir,".vimrc"

  # make sure that minipac exists
  FileUtils::mkdir_p minpac

  # if minipac doesn't exist, install it
  unless File.exists? minpac_plug
		FileUtils.cd minpac
		`git clone https://github.com/k-takata/minpac.git`
	end

  puts "copying vim files"
  FileUtils.cp vimrc_src, vimrc_dst
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
  homedir   = File.expand_path("~")
  dot_zsh   = File.join(homedir,".zsh")
  mkdir(dot_zsh) unless File.exists?(dot_zsh)

  ["zshrc","aliases","inputrc", "gemrc","dircolors"].each { |zfile| FileUtils.cp(zfile,"#{homedir}/.#{zfile}") }
end

desc 'Install postgres Related Stuff'
task :install_postgres do |t|
  puts "installing postgres stuff.."
  homedir  = File.expand_path("~")
  dot_psql = File.join(homedir,".psql")
  mkdir(dot_psql) unless File.exists?(dot_psql)
  FileUtils.cp("psqlrc",File.join(homedir,".psqlrc"))
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
