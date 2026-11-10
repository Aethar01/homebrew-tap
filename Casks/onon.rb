cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.3"
  sha256 arm:   "f8f5d98b5107705e1cb438e54106b9cf52edaa208edd50f9777f253c17847d5b",
         intel: "4c09c9458d950d33079db12837a37347bf544d39d96dbdad244f2b180d84433d"

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
