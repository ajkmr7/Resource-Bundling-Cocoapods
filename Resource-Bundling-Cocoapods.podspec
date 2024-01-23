Pod::Spec.new do |s|
  s.name             = 'Resource-Bundling-Cocoapods'
  s.version          = '0.0.1'
  s.summary          = '<TBA>'


  s.homepage         = 'https://github.com/ajkmr7/Resource-Bundling-Cocoapods'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ajay Kumar' => 'ajayyasodha@gmail.com' }
  s.source           = { :git => 'https://github.com/ajkmr7/Resource-Bundling-Cocoapods.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Resource-Bundling-Cocoapods/Classes/**/*'
  
  #  s.resource_bundles = {
  #   'Resource-Bundling-Cocoapods' => ['Resource-Bundling-Cocoapods/Assets/**']
  # }
end
