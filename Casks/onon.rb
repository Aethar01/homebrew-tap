cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.7"
  sha256 arm:   "52e7825bca25812708b0bd176e33cf5c726783c8325603ee34aca8a43f2376d6",
         intel: "61bfa92a5546ef95eee4163161fdd3194139e8ecc5886da7e1a6ccfbdad1f695"

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
