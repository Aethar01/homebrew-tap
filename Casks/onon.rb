cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.0"
  sha256 arm:   "4f79deeae0c9b72e29d4a53c8eeed71d15999da2096007b632191d3430c42e97",
         intel: "49c99ff87ae6a94ce5b5ecb86f0edb9740adedc17ca5e6f87eb2596c33d3e62e"

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
