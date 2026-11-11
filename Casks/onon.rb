cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.11"
  sha256 arm:   "96bffa509914dac7ceabcae38f171d3fd1a3ff7cf3ff63c9abf6377c4502e394",
         intel: "49e14e83842ea269d0e0a575466cc950ce6af6cd6ab530a064045e6a5399e154"

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
