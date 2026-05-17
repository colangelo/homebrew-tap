class Herdr < Formula
  desc "Terminal workspace manager for AI coding agents"
  homepage "https://github.com/colangelo/herdr"
  version "0.5.10"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "ae88b83e56d689ed8188873f77075f17b1ef734e7f92abb1bdd07ad4a58c3bb3"
    else
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "9acee9f2530ecabc091cb4ddc22796032ba1f48bbd78f6495f3b821b594eec7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-linux-aarch64"
      sha256 "e2ad49afa6540b81128ea25c2d8ce81f54b88e3e8d69e792efbd2aa00abf851d"
    else
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-linux-x86_64"
      sha256 "87eff9ae3fbdf752165d618fcf42b8c6f776031a5abcfe2f049cf47259dad6e8"
    end
  end

  def install
    binary = Dir["herdr-*"].first || "herdr"
    bin.install binary => "herdr"
  end

  test do
    assert_match "herdr #{version}", shell_output("#{bin}/herdr --version")
  end
end
