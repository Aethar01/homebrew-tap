cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.16"
  sha256 arm:   "b82b95dc32baa76f7978e1f4c122543463237f0c2f6740bca02a38cbe6edf8a7",
         intel: "1835ef8d44e60a27cb3882d014e45f2b2fad8322845634eed39aa2a51dcdb72b"

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
