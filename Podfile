# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'Covid-19' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Covid-19
  pod 'RSJ', :git => 'https://github.com/rynssnjn/RSJ.git', :branch => '1.4.0/alert'
  pod 'SnapKit'
  pod 'Astral'
  pod 'BFAstral'
  pod 'FSCalendar'
  pod 'STPopup'
end

post_install do |installer|
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods-Covid-19/Pods-Covid-19-acknowledgements.plist', 'Covid-19/Supporting Files/Acknowledgements.plist', :remove_destination => true)
end
