cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.6"
  sha256 arm:   "a03361f8bc198828674553fac6825be75d36ebf7027a2061b54168126637b45a",
         intel: "b3aef12d3ab9a1985535d1db5ffc5b374cb8d617bc8a33b9244699f0677c4cf6"

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
