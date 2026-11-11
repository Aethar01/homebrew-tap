cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.10"
  sha256 arm:   "c1c0b27d5b980089db03253d4cca8680a6609ff66bd8527d29e971c8c8be775d",
         intel: "5b4424d6374e341f0ecb2be5e2fd0be51c7e3fc5ba0d98f0c748bd3ec7c8b5e7"

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
