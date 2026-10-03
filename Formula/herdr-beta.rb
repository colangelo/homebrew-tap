class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.8.2-ac-beta.131-vidal"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
      sha256 "383119c814a6266597683bff8274ef5485515b2323670e0a59e4d207579f2456"
    else
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-x86_64"
      sha256 "8fcbba33fbf68bfe1b66e2ff18e64ac0faf9a6806549bf8d3731bf1e2f85dc53"
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
