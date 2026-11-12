cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.13"
  sha256 arm:   "21809d5ab8410d9fb52255d887bdf2b499767b1e0a4984734ea8c4294c5f3eba",
         intel: "32610b7db0c5021a193454fc868f3c3292950a1efcae4dfdf845268b746a101b"

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
