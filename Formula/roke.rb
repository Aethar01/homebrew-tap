class Roke < Formula
  desc "Quiet todo list and Kanban board for the terminal"
  homepage "https://github.com/Aethar01/roke"
  url "https://github.com/Aethar01/roke/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "6f874cd83834b3ad7f1ccf726ae2cb5a1aca7af57d21e31baa30a45499b5231b"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "roke", shell_output("#{bin}/roke --help")
  end
end
