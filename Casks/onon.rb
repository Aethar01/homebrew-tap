cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.1"
  sha256 arm:   "12f2c4358e1bf85f6a62ca605889d7b94afc8e7d714bba8ba34f61a86034af5b",
         intel: "1867a8648a001defc5f5803898aa0a6669010f1d69d5c7245c85ed142607ae83"

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
