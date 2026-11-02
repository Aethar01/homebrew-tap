cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.11.4"
  sha256 arm:   "0e73741c0f673be6c7f2f85a05fcff1d6e29e5db455fbf6d4fe4d733ea3d1fad",
         intel: "2e3530ba731d3a7fcf511d01e9c5cccc038fa89bea5da96803bba6bb3e6818fc"

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
