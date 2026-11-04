cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.13.1"
  sha256 arm:   "c57548587d0f932087cdb181c5ca4a3f69454c11ab846555be88325bc524bba2",
         intel: "f6245a0903738757fa56164989b04c34512ead10e975e93c16ca916b86b6dec7"

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
