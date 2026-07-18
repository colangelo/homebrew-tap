class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr"
  version "0.7.4-ac-beta.20260718230208"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-aarch64"
      sha256 "c5dc53693e4791b4f642e189ddc94b787bde041dcfb6b847db85d8febdea95f5"
    else
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-x86_64"
      sha256 "84416cdd4a101cb09966f0be99eeb842838a20ea7e7b7175c5e3467b54d4c252"
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
