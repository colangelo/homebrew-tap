class HerdrMax < Formula
  desc "Terminal workspace manager for AI coding agents (Herdr Max, beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.10.0"
  license "AGPL-3.0-or-later"

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
    sha256 "fa7eb133b92a585b2de78a8f86741db8aad3535e37bbb1d8744254491b48debf"
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
    assert_match "herdr #{version}", shell_output("#{bin}/herdr-max --version")
  end
end
