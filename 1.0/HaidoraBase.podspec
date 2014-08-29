Pod::Spec.new do |s|
  s.name         = "HaidoraBase"
  s.version      = "1.0"
  s.summary      = "some basic codes for app."

  s.description  = <<-DESC
                   A longer description of HaidoraBase in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/Haidora/HaidoraBase"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  
  s.author             = { "mrdaios" => "mrdaios@gmail.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/Haidora/HaidoraBase.git", :tag => s.version.to_s }

  s.subspec 'HABCore' do |habCore|
    habCore.source_files = 'Source/HABCore/**/*.{h,m}','Source/*.{h,m}'
  end
  s.subspec 'HABMacro' do |habMacro|
    habMacro.source_files = 'Source/HABMacro/**/*.{h,m}','Source/*.{h,m}'
  end
  s.subspec 'HABStyle' do |habStyle|
    habStyle.source_files = 'Source/HABStyle/**/*.{h,m}','Source/*.{h,m}'
    #habStyle.dependency "RETableViewManager", "~> 1.5.11"
  end
  s.subspec 'HABCategory' do |habCategory|
    habCategory.source_files = 'Source/*.{h,m}'
    habCategory.dependency 'HaidoraBase/HABCore'
    habCategory.dependency "JRSwizzle", "~> 1.0"

    habCategory.subspec 'HABCategory_Foundation' do |habCategory_Foundation|
      habCategory_Foundation.source_files = 'Source/HABCategory/Foundation/**/*.{h,m}','Source/HABCategory/*.{h,m}'
    end
    habCategory.subspec 'HABCategory_UIKit' do |habCategory_UIKit|
      habCategory_UIKit.source_files = 'Source/HABCategory/UIKit/**/*.{h,m}','Source/HABCategory/*.{h,m}'
      habCategory.dependency "NUI", "~> 0.5.4"
      habCategory.dependency "MBProgressHUD", "~> 0.8"
    end
  end
  s.subspec 'HABNetWork' do |habNetWork|
    habNetWork.source_files = 'Source/HABNetWork/**/*.{h,m}','Source/*.{h,m}'
    habNetWork.dependency "MKNetworkKit", "~> 0.87"
  end
  s.subspec 'HABView' do |habView|
    habView.source_files = 'Source/HABView/**/*.{h,m}','Source/*.{h,m}'
  end
  s.subspec 'HABUtil' do |habUtil|
    habUtil.source_files = 'Source/HABUtil/**/*.{h,m}','Source/*.{h,m}'
  end

  s.resources = "Resource/storyboard/**/*.{storyboard}","Resource/xib/**/*.{xib}","Resource/bundle/**/*.{bundle}"

  s.requires_arc = true

end
