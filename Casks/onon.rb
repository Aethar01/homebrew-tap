cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.13.2"
  sha256 arm:   "055fac266fff43769a88a5e3f93820ebd038d3e5d77ea5f16cbe483ba37a59d9",
         intel: "305b3068660265bc44c8a16b8a8b15488dd44ed5776d40d0ee13f20ca0c9a4b2"

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
