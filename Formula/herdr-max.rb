class HerdrMax < Formula
  desc "Terminal workspace manager for AI coding agents (Herdr Max, beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.12.0"
  license "AGPL-3.0-or-later"

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
    sha256 "273c3304999f44d7da0df068bcfa3dcb62c8fca0eae62c8fb6a028e6378380ff"
  end

  def install
    binary = Dir["herdr-*"].first || "herdr"
    bin.install binary => "herdr-max"
  end

  def caveats
    <<~EOS
      herdr runs a persistent background server. To upgrade without killing
      your running panes, migrate the server onto the new binary after upgrading:

        brew upgrade herdr-max
        herdr-max server live-handoff --import-exe "#{opt_bin}/herdr-max"

      (self-update is disabled for Homebrew installs; use brew upgrade.)
      The old herdr-beta command stays as a link while the herdr-beta formula
      is installed.
    EOS
  end

  test do
    assert_match "herdr-max #{version}", shell_output("#{bin}/herdr-max --version")
  end
end
