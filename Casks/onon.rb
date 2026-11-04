cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.13.3"
  sha256 arm:   "cfd1d25df5cb550f1b4cf871e0e6ed1b4f7402162d238e94df0ca8152e6646cf",
         intel: "2ebd7a567956c3461940ca13baf88967f736c61fffdd3d9d3f9808cfdf658fba"

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
