class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr"
  version "0.8.0-ac-beta.59-conceicao"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-aarch64"
      sha256 "c20c9f33fce20d4a7bc12fe2b79d5cf11aa7fc1fec3b410c5ca52d1099d58d2d"
    else
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-x86_64"
      sha256 "e680cb530ba7bee9a690ae2ec401d3ea5d53a5d9e0420bd2f2c78d7d68e48094"
    end
  end

  def install
    binary = Dir["herdr-*"].first || "herdr"
    bin.install binary => "herdr-beta"
  end

  def caveats
    <<~EOS
      herdr runs a persistent background server. To upgrade without killing
      your running panes, migrate the server onto the new binary after upgrading:

        brew upgrade herdr-beta
        herdr-beta server live-handoff --import-exe "#{opt_bin}/herdr-beta"

      (self-update is disabled for Homebrew installs; use brew upgrade.)
    EOS
  end

  test do
    assert_match "herdr #{version}", shell_output("#{bin}/herdr-beta --version")
  end
end
