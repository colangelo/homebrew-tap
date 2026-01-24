class Hp < Formula
  desc "Prettyping-style HTTP(S) latency monitor"
  homepage "https://github.com/colangelo/HittyPing"
  version "0.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-arm64"
      sha256 "fe8eef741b21f91b8f37b2ca93cd9576eb2681c7f1de0a5e2d7f86928e54515e"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-amd64"
      sha256 "d4af92df82a79a68a2205821626cbede01d945a78e064609f2f48feaa98c2b7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-arm64"
      sha256 "d72373193e2e1ed39d8165e4e642ae07a47d08bd0f937d6487fc59ff938b4038"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-amd64"
      sha256 "679cfb01a4fc205da80b5ba2b5c2677ef4f7f0bc2d6167f960c172b2b12c8100"
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
