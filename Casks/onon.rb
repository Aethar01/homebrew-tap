cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.13.4"
  sha256 arm:   "8a5b48dfe351fe74bf10396e544600f18fb6d1c19ee04652cd98a7bb8d6e9fe7",
         intel: "24dcb3e3633db1828a8212511ac357d3c02610589a48f6cda73371d103e4d1e3"

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
