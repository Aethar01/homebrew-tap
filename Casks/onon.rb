cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.6"
  sha256 arm:   "1c0384146e234d15b6ff8024286f24dd1aee1c8cd25ff06730f823860a7fe867",
         intel: "7b0247e9cda6ebef357a4c0e036c0a4ab6389ac66d7266ed11293ed5f879382e"

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
