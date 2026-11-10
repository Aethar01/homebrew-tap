cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.2"
  sha256 arm:   "bdcf7d0a809fb3bd447fb6466bc53017c78e5d27c52aaad5201fb4cd9e6f33d4",
         intel: "519b77a91f94544b7072969fcdc1d9c5af270d835092f16f9afa8742c4d74801"

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
