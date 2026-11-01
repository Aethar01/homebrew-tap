cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.11.3"
  sha256 arm:   "200ba498f31140b0d1fea2f631d8351ac322fe9e36a324f1c438099eb3157f4a",
         intel: "19aa52d0444e440b72372b26aedff1ee3e91ffa36fc90bc1eb90adcf5dd464cb"

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
