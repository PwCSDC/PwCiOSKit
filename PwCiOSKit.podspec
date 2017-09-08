

Pod::Spec.new do |s|


  s.name         = 'PwCiOSKit'
  s.version      = '1.0.0'
  s.summary      = 'The PwCiOSKit framework is designated for PwC team internal usage.'
  s.homepage     = 'https://github.com/AaronHu2017/PwCiOSKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Aaron Hu' => 'aaron.hu@pwc.com' }
  s.platform     = :ios, '9.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
  s.source       = { :git => 'https://github.com/AaronHu2017/PwCiOSKit.git', :tag => '1.0.0' }

  s.source_files  = 'PwCiOSKit', 'PwCiOSKit/**/*.{h,m,swift}'
 
end
