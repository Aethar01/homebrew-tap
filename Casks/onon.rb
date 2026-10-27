cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.7"
  sha256 arm:   "29c163fe49d761923499c1c41b6b2712fa2c715d52f396c0158cfe606ac37bef",
         intel: "779478c3e77dd162039759df8baba1a414d9af462b008c7cea22f7f511275799"

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
