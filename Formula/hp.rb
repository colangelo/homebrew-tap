class Hp < Formula
  desc "Prettyping-style HTTP(S) latency monitor"
  homepage "https://github.com/colangelo/HittyPing"
  version "0.8.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-arm64"
      sha256 "1f77966e1a374eb8ce4c3a04e0793e25df250708da3945fba5c202506de0d22b"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-amd64"
      sha256 "656419c63a49a28f34415576e6621d6fb079bba3ef926188650a1f8f786009d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-arm64"
      sha256 "d3a3c6ea992cc631077881c888c1fcdf1a7a21ed906649d5471dd1d1c1c8432d"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-amd64"
      sha256 "962e4adf7aaeee65954cd6bb196e8a95c741862c9ed2a11e850d2d541d1e3da3"
    end
  end

  def install
    binary = Dir["hp-*"].first || "hp"
    bin.install binary => "hp"
  end

  test do
    assert_match "hp (hittyping)", shell_output("#{bin}/hp --version")
  end
end
