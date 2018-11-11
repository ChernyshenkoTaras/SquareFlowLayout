Pod::Spec.new do |s|
  s.name             = 'SquareFlowLayout'
  s.version          = '0.0.1'
  s.summary          = 'A lightweight implementation of Instagram like UICollectionViewFlowLayout'

  s.description      = <<-DESC
    Making more easy to implement dynamic flow layout similar for Instragram explore screen
                       DESC

  s.homepage         = 'https://github.com/ChernyshenkoTaras/SquareFlowLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Taras Chernyshenko' => 'taras.chernyshenko@gmail.com' }
  s.source           = { :git => 'https://github.com/ChernyshenkoTaras/SquareFlowLayout.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@t_chernyshenko'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SquareFlowLayout/Source/Classes/**/*'
end
