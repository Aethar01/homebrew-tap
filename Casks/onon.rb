cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.8"
  sha256 arm:   "6c88be7879a92978bbf0d9027fff7d52059347845a49d21fd822b20684f58e76",
         intel: "8816439737f529ff34ed7c00f4d9ced32685e1b37125bdb1aacb0fbad3f632b3"

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
