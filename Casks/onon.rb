cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.14"
  sha256 arm:   "264806bc7459cc71be218738f8fe6ee5fa900a5e22fb36fc3ad415a791200664",
         intel: "b31cf7357987b53838c0b9f4d9138d95c3a8801027ecbd2824d66121ed16a987"

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
