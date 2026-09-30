class HerdrBeta < Formula
  desc "Terminal workspace manager for AI coding agents (beta channel)"
  homepage "https://github.com/colangelo/herdr"
  version "0.8.2-ac-beta.121-cambiaso"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-aarch64"
      sha256 "5ab3e2152eb80fa0542d73a6e52c5e666f398f02c52cf67b8d28fc6263a5ea73"
    else
      url "https://github.com/colangelo/herdr/releases/download/beta/herdr-macos-x86_64"
      sha256 "f6dbc2b68f478843751aae2d8af22ccad195ecd3c55a21fa760fc2e6a6051f98"
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
