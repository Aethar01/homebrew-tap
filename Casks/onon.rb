cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.0"
  sha256 arm:   "dc03b0079063fa3f4c340bc1c81e931183d2460761b0d38bd6d390b6f7e6e02b",
         intel: "baf34121eef8705a0d4ca609b2a15f0c46ccdbc035c0f737058220eeee2bbfb7"

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
