cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.4"
  sha256 arm:   "856bfc0908b8e50a5a779513e502c3697e7d25d449cca1378827d8d902f84e12",
         intel: "7be8fe023382773230da678f1d59cce85634bea0ffea0ec6571c5a73b5e3d1a6"

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
