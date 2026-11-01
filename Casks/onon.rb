cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.11.2"
  sha256 arm:   "9cfeb91f31390dd8fa987ae0da691f40371e12f4ce28f448157d068e41908afd",
         intel: "92bfefbcf0404b018620510408dba8635e2d29e361d2b6737cb09739a49dd8b1"

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
