cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.2"
  sha256 arm:   "7afca859ea05d4296fca1f86e7b8783203bcfe4807935c2cb7e95dc07e893ee4",
         intel: "9815a964969131d9c135363cd10b7cab819feb1f5003dc3c12fddf9d9ca1fc05"

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
