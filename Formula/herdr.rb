class Herdr < Formula
  desc "Terminal workspace manager for AI coding agents"
  homepage "https://github.com/colangelo/herdr"
  version "0.7.1-ac"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-macos-aarch64"
      sha256 "7e801b6668c132c45b2aa97d44e071c62396fee4175408489bfd38dbf800da51"
    else
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-macos-x86_64"
      sha256 "9fdc1b941abc22581d326657e1089d8ee37874c8523606b1c75cae0351790b44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-linux-aarch64"
      sha256 "e23d7b974927d2935ec3e37bd367367320f7ea2a10185df1409c4baf785e2150"
    else
      url "https://github.com/colangelo/herdr/releases/download/v#{version}/herdr-linux-x86_64"
      sha256 "450bc69a53ebec506d7289305d9ce46dd4c1a19bbd89f9a9251ee0e538271c8c"
    end
  end

  def install
    binary = Dir["herdr-*"].first || "herdr"
    bin.install binary => "herdr"
  end

  test do
    assert_match "herdr #{version}", shell_output("#{bin}/herdr --version")
  end
end
