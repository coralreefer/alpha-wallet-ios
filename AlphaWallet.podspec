Pod::Spec.new do |spec|
  spec.name         = "AlphaWallet"
  spec.version      = "v3.43-439"
  spec.summary      = "An advanced Ethereum/EVM mobile wallet."
  spec.description  = <<-DESC
  AlphaWallet is an open source programmable blockchain apps platform. It's compatible with tokenisation framework TokenScript,
  offering businesses and their users in-depth token interaction, a clean white label user experience and advanced security options.
  Supports all Ethereum based networks.
                   DESC
  spec.homepage     = "https://github.com/coralreefer/alpha-wallet-ios"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Andrey Scherbovich" => "andrey@gnosis.io", "Dmitry Bespalov" => "dmitry.bespalov@gnosis.io" }
  spec.cocoapods_version = '>= 1.4.0'
  spec.platform     = :ios, "11.0"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/coralreefer/alpha-wallet-ios.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*.swift"
  spec.requires_arc = true
end
