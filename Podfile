# Podfile
use_frameworks!

target 'Cloudy' do
	platform :ios, '10.0'
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
end

# RxTests and RxBlocking make the most sense in the context of unit/integration tests
target 'CloudyTests' do
	inherit! :search_paths
    pod 'RxBlocking', '~> 3.0'
    pod 'RxTest',     '~> 3.0'
end