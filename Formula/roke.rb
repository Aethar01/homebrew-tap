class Roke < Formula
  desc "Quiet todo list and Kanban board for the terminal"
  homepage "https://github.com/Aethar01/roke"
  url "https://github.com/Aethar01/roke/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "e32d4a36e011e9dc81ca8d98ede83f6cd33af6e28a6ecec98c9d49f9faea6d81"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "roke", shell_output("#{bin}/roke --help")
  end
end
