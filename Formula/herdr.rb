class Herdr < Formula
  desc "Terminal workspace manager for AI coding agents"
  homepage "https://github.com/colangelo/herdr"
  version "0.7.4-ac"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "d7476c7e53ee755edf7a96d06217f42aa7f2b95a898ff857c0a929ac317445e8"
    else
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "7896f0b265dfe4b26d5bab9947119b891bc438d396378da8b76880861e59b60f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-linux-aarch64"
      sha256 "af8352c3559f0a007481734869107e7de7e43cf07cca83d437b60e2caea81c91"
    else
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-linux-x86_64"
      sha256 "1c331cb08a38af5c9519ed4bc3c7e4e7a17195743d3cc58fba20a5278391ef1d"
    end
  end

  def install
    binary = Dir["herdr-*"].first || "herdr"
    bin.install binary => "herdr"
  end

  def caveats
    <<~EOS
      herdr runs a persistent background server. To upgrade without killing your
      running panes, migrate the server onto the new binary after upgrading:

        brew upgrade herdr
        herdr server live-handoff --import-exe "#{opt_bin}/herdr"

      (self-update is disabled for Homebrew installs; use brew upgrade.)
    EOS
  end

  test do
    assert_match "herdr #{version}", shell_output("#{bin}/herdr --version")
  end
end
