
Pod::Spec.new do |s|
  s.name             = 'LitSwift'
  s.version          = '0.0.1'
  s.summary          = 'LitSwift lib'
  s.description      = <<-DESC
 LitSwift lib desc 
                       DESC
  s.homepage         = "https://github.com/LevenWin/LitSwift"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leven' => 'isrealleven@gmail.com' }
  s.platform         = :ios, "13.0"
  s.source           = { :git => 'git@github.com:LevenWin/LitSwift.git', :tag => "#{s.version}" }
  s.source_files     = 'LitSwift/Sources/**/*.{h,m,swift}'
  s.dependency 'WKWebViewJavascriptBridge'
end
