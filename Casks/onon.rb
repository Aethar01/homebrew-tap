cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.17"
  sha256 arm:   "4dcb65c57162552886616d1c17a65e27cf55f0e03712bd56b36bab08366b64a2",
         intel: "aa660e664b5edb50fb8f66930b9739eb773f6e95937fb7e19e0894469ecf7139"

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
