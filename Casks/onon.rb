cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.5"
  sha256 arm:   "0acf04aae44d860f9878eb6686cf92311357de1602c4d54a3a8c1bd4de1abf20",
         intel: "25eb281b7c2b3b941602439e3e6f1ec800c446999cf880fc4eacd63047453ce1"

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
