Pod::Spec.new do |s|
  s.name             = "HaidoraBase"
  s.version          = "2.0"
  s.summary          = "HaidoraBase."
  s.description      = <<-DESC
                          some basic codes for app.
                       DESC

  s.homepage         = "https://github.com/Haidora/HaidoraBase"
  s.license          = 'MIT'
  s.author           = { "mrdaios" => "mrdaios@gmail.com" }
  s.source           = { :git => "https://github.com/Haidora/HaidoraBase.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec 'Core' do |core|
      core.source_files = 'Pod/Classes/Core/**/*.{h,m}','Pod/Classes/*.{h,m}'
  end
  s.subspec 'Category' do |category|
      category.source_files = 'Pod/Classes/*.{h,m}'
      
      category.subspec 'Foundation' do |foundation|
          foundation.source_files = 'Pod/Classes/Category/Foundation/**/*.{h,m}','Pod/Classes/Category/*.{h,m}'
      end
      category.subspec 'UIKit' do |uiKit|
          uiKit.source_files = 'Pod/Classes/Category/UIKit/**/*.{h,m}','Pod/Classes/Category/*.{h,m}'
      end
  end
  s.subspec 'Util' do |utils|
      utils.source_files = 'Pod/Classes/Util/**/*.{h,m}','Pod/Classes/*.{h,m}'
  end
  s.resource_bundles = {
      'HaidoraBase' => ['Pod/Assets/*.*']
  }
end
