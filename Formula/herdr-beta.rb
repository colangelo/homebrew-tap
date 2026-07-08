class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr"
  version "0.7.3-ac-beta.20260708214701"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-aarch64"
      sha256 "b835edd1926f9f1717a479108159219b57fe4dd9c049a1a81bd603b05c11d226"
    else
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-x86_64"
      sha256 "5621109caf01c77ffdd26a7830549115b6177beb15eb272c164c6161e36916fc"
    end
  end

  def install
    binary = Dir["herdr-*"].first || "herdr"
    bin.install binary => "herdr-beta"
  end

  test do
    assert_match "herdr #{version}", shell_output("#{bin}/herdr-beta --version")
  end
end
