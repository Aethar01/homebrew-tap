cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.12"
  sha256 arm:   "454abebe1e8916678e728ee4f7cc02d14458fde63df496d3592beb1c13152308",
         intel: "2137ec791629be432c732df9a0812fb2c51ad141475ac658eddda3905a12d6ae"

  url "https://github.com/Aethar01/onon/releases/download/#{version}/onon-#{version}-darwin-#{arch}.dmg"
  name "onon"
  desc "Quiet reader for the keyboard"
  homepage "https://ononreader.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  postflight_steps do
    run "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "{{appdir}}/onon.app"]
  end

  depends_on macos: :monterey

  app "onon.app"
  binary "#{appdir}/onon.app/Contents/MacOS/onon"

  zap trash: [
    "~/Library/Application Support/onon",
    "~/Library/Caches/onon",
  ]
end
