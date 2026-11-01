class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.9.5-ac-beta.183-perin"
  license "AGPL-3.0-or-later"

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
    sha256 "f8bc291828ad5545b310308999b9d36484d287cdf3bd52be2ec04ac501c25f4d"
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
