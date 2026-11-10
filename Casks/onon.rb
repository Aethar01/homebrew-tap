cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.1"
  sha256 arm:   "fb638383fdd4f31bb1e2be61e3e26513b8ef317d75a9bfeea37711b52514d207",
         intel: "b713f8bb4aa7633e9617f77ff50b7cc774d69947a1349232b1e93fef5f86421a"

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
