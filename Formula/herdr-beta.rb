class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr"
  version "0.7.5-ac-beta.53-perin"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-aarch64"
      sha256 "9a3982cb1c98afa928fe64ce07c3f12c35f1dcef7ba1600c668bbfc675ddc9e8"
    else
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-x86_64"
      sha256 "eaa159eae924f61295600305d55255152137434c2a033c83763ae18714cae888"
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
