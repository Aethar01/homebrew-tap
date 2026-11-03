cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.12.0"
  sha256 arm:   "b1e876a3ffaebcf1c49341d8ca311ad736e00cf0548fd3d1f7a67c94bd7be14b",
         intel: "ae27e5d9a18cfbc3e7f94939466ec1f2ebf510b43075f46e8cc4c9ca18171f51"

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
