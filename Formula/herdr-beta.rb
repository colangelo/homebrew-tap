class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.9.3-ac-beta.158-szczesny"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
      sha256 "5433f6cf7f1917dc48fa8aa51bd13c8ac83c5fa8948f40d1971e49b8f5dd75b4"
    else
      url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-x86_64"
      sha256 "47453dd12f3cf18d70d41e6faa36240adf85ce840f0fd024fcdb9b5cc27adb28"
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
