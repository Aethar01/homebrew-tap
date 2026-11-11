cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.9"
  sha256 arm:   "dbc3cd069f5a20ac1ae825996eca964e413a5e303553d877855aa6618df20967",
         intel: "56ada2ad6a3db24047d7dc6b74719db12ff11ecebaa866ed523dcd4baeb2fec2"

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
