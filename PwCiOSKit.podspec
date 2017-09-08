

Pod::Spec.new do |s|


  s.name         = "PwCiOSKit"
  s.version      = "1.0.1"
  s.summary      = "The PwCiOSKit framework is designated for PwC team internal usage."
  s.homepage     = "https://github.com/PwCSDC/PwCiOSKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Aaron Hu" => "aaron.hu@pwc.com" }
  s.platform     = :ios, "9.0"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
  s.source       = { :git => "https://github.com/PwCSDC/PwCiOSKit.git", :tag => s.version }

  s.source_files  = "PwCiOSKit", "PwCiOSKit/**/*.{h,m,swift}"
 
end
