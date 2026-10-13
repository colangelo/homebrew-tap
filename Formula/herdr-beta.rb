class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.9.3-ac-beta.159-ronaldo"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
      sha256 "425c2107e952447730ca1da4735f066c6b0045e7675eeb6fba9af6b985f2774c"
    else
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-x86_64"
      sha256 "ce196549d77563dd6800a1886e71d5bbf9e83152cb93e7ffb86e9c8294c141bf"
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
