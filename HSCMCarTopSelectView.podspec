
Pod::Spec.new do |s|
s.name             = 'HSCMCarTopSelectView'
s.version          = '1.0.1'
s.summary          = 'Swift4的自定义 HSCMCarTopSelectView'


s.description      = <<-DESC
Swift4 HSCMCarTopSelectView,支持自定义扩展，欢迎提出建议
DESC

s.homepage         = 'https://github.com/DreamLCM/HSCMCarTopSelectView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'LCM' => '212763791@qq.com' }
s.source           = { :git => 'https://github.com/DreamLCM/HSCMCarTopSelectView.git', :tag => s.version.to_s }

s.ios.deployment_target = '12.1'
s.swift_version = '4.2'
s.source_files = 'HSCMCarTopSelectView/HSCMCarTopSelectView/Class'

end


#验证命令：pod lib lint HSCMCarTopSelectView.podspec --verbose
#提交命令：pod trunk push HSCMCarTopSelectView.podspec
