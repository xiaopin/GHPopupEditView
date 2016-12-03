Pod::Spec.new do |s|
  s.name         			= "GHPopupEditView"
  s.version      			= "1.0.0"
  s.summary      			= "A popup view for editing information."
  s.homepage     			= "https://github.com/xiaopin/GHPopupEditView"
  s.license      			= "GPL v3"
  s.author             		= { "xiaopin" => "xiaopin2013@gmail.com" }
  s.social_media_url   		= "http://www.0daybug.com"
  s.requires_arc 			= true
  s.platform     			= :ios, "7.0"
  s.ios.deployment_target 	= "7.0"
  s.source       			= { :git => "https://github.com/xiaopin/GHPopupEditView.git", :tag => "#{s.version}" }
  s.source_files  			= "GHPopupEditView/*.{h,m}"
end
