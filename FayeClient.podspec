Pod::Spec.new do |s|
  s.name         = "FayeClient"
  s.version      = "0.0.1"
  s.summary      = "Faye Client for iOS."
  s.description  = <<-DESC
                   For one of my project, I needed an objective-C faye client. The best I've been able to find is the one created by pcrawfor which is not maintained anymore. I decided to copy the project and update the web socket library in order to user Socket Rockect, maintainted by Square, JSONKit, and make the library using ARC by default.
                   DESC
  s.homepage     = "https://github.com/jayztemplier/FayeClient"
  s.license      = { :type => 'MIT', :file => "LICENSE" }
  s.authors      = 'Paul Crawford', 'Jeremy Templier'
  s.source       = { :git => "https://github.com/mikker/FayeClient.git", :commit => 'aeccbba4293a3e51996d998156050ddfa41fdca2' }
  s.source_files  = 'Library/*'
  s.requires_arc = true
  s.dependency 'JSONKit' #, '~> 1.4'
  s.dependency 'SocketRocket'
end
