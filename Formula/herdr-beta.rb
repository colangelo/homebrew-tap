class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.8.2-ac-beta.138-barzagli"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
      sha256 "d6845d441eec02b9d411294dd7c2d49c0c6d40485b90ca64372af0cc78a6d731"
    else
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-x86_64"
      sha256 "361025e7e2d63044e4bd9ceb4967e89d8a5f099b68b704a3384da5931f05da67"
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
