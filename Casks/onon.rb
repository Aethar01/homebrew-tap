cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.18"
  sha256 arm:   "e9989180d3c9d58c6cb3eec3388c5521b8de68e4be5c61e7a10dd421ab68c1d4",
         intel: "c167abc9ecdfa42d5c46aca348621b2373f30ebdba7afa5dc0cb12322414736f"

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
