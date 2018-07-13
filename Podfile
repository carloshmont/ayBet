platform :ios, '9.0'

workspace 'ayBet'
project 'ayBetMVP/ayBetMVP.xcodeproj'
project 'ayBetMVC/ayBetMVC.xcodeproj'
project 'Data/Data.xcodeproj'

target 'ayBetMVP' do
	project 'ayBetMVP/ayBetMVP.xcodeproj'
	pod 'Firebase/Core'
end

target 'ayBetMVC' do
	project 'ayBetMVC/ayBetMVC.xcodeproj'
	pod 'Firebase/Core'
end

target 'Data' do
	project 'Data/Data.xcodeproj'
	pod 'Firebase/Core'
	pod 'Firebase/Database'

end
