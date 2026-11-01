cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.11.1"
  sha256 arm:   "0dee67ff99ed08704426ab3d49aa6208b4f0ed30aa243c4ad0bd66b1be1148e8",
         intel: "deb3e33bb77a6d3cc96b5b6dddeafc8937a709837820a62145d2e47bf786599f"

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
