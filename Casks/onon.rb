cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.13.0"
  sha256 arm:   "9cdf7cca0f3b63363d70dbbf637aa811fc337dda5225a584fd337eabe5b45d5f",
         intel: "0c7d325c1ef8efb66dee7e5a60fe8d3dede22f87b0756656bb1a5a8da964ac4e"

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
