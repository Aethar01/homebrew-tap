cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.14.15"
  sha256 arm:   "33506a24cb1ba0ba558a64696627bc5328c2a35498373cb3246fb7e11fa38acf",
         intel: "876ee6a0f838fbb2f2800048fa295be4bcf8bb10f5822aacdaeb7837ea4d6701"

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
