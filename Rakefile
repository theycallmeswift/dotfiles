class Installer
  def symlink(target, link)
    if File.symlink?(link)
      unlink(link)
    elsif File.exist?(link)
      puts "ERROR: File exists: #{link}"
      exit 1
    end
    puts "Symlinking #{link} => #{target}"
    File.symlink(target, link)
  end

  def delete_symlink(link)
    unlink(link) if File.symlink?(link)
  end

  def unlink(link)
    if File.exist?(link)
      descriptor = File.symlink?(link) ? "symlink" : "file"
      puts "Deleting #{descriptor} #{link}"
      File.unlink(link)
    end
  end
end

def pwd; File.dirname(__FILE__); end
def target_path(file)
  File.join(ENV["HOME"], ".#{file}")
end

def run_post_installer!
  filepath = File.join(pwd, "bin/post-installer")

  if File.exist?(filepath)
    output = `. #{filepath}`
    puts output
  end
end

files = File.new(File.join(pwd, "MANIFEST"), "r").read.split("\n")

desc "Symlink all dotfies"
task :install do
  files.each do |file|
    Installer.new.symlink(File.join(pwd, file), target_path(file))
  end

  run_post_installer!
end

desc "Remove all dotfies"
task :uninstall do
  files.each do |file|
    Installer.new.unlink(target_path(file))
  end
end
