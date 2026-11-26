class Roke < Formula
  desc "Quiet todo list and Kanban board for the terminal"
  homepage "https://github.com/Aethar01/roke"
  url "https://github.com/Aethar01/roke/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1081b0f2f39fee54d4bc8e067875a62388f33facbc57b713fa4aeb363dd2e884"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "roke", shell_output("#{bin}/roke --help")
  end
end
