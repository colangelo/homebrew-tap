class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.9.3-ac-beta.155-douglascosta"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
      sha256 "c2253666919237559e7f42bacbe7df51c1da93127b5eafea2d88780cc49e8d1d"
    else
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-x86_64"
      sha256 "fc2a611f25d6ec09427fed0dd46d097aa0724317c1818bd16d5ee71b91fa8d87"
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
