class Roke < Formula
  desc "Quiet todo list and Kanban board for the terminal"
  homepage "https://github.com/Aethar01/roke"
  url "https://github.com/Aethar01/roke/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "1712545d0c608db13bddad67fe8b27e5f04cd7f0cfa09e8203abffdd723222f3"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "roke", shell_output("#{bin}/roke --help")
  end
end
