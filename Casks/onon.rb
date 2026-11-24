cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.20"
  sha256 arm:   "cf95648021a079fb802da4ee2b1f1608b2231dacecf62eaac5442375ffc4de13",
         intel: "7a7a85e5ace1b3bea7b98724008fd4c6853c925f05489437c8d2b247157546f1"

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
