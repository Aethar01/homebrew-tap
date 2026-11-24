cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.19"
  sha256 arm:   "1903fa5b004638df61d2d10cd4d9b0d0cc5621aeaa5496f76f636c0ed7744cf7",
         intel: "1f8e5a85b1b9dc152bf504bdac49a695990c32ecb015d70a151388c47c5d7f00"

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
