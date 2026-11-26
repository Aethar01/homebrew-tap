class Roke < Formula
  desc "Quiet todo list and Kanban board for the terminal"
  homepage "https://github.com/Aethar01/roke"
  url "https://github.com/Aethar01/roke/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9162710806457ed92975eaabae93177617570eff75f10c9f7e33008e30347972"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "roke", shell_output("#{bin}/roke --help")
  end
end
