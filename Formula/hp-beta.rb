class HpBeta < Formula
  desc "Prettyping-style HTTP(S) latency monitor (beta channel)"
  homepage "https://github.com/colangelo/HittyPing"
  license "MIT"
  version "0.8.3-beta.20260223212345"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-arm64"
      sha256 "a4b11a0b0322afce021e9af74484b5dd0d8f66849ec40903166291b0d3ce7504"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-amd64"
      sha256 "e238a33a47dc5e2a8f809d80de3d746a9b914107e7fe86277cb9dac2acdb33b4"
    end
  end

  def install
    binary = Dir["hp-*"].first || "hp"
    bin.install binary => "hp-beta"
  end

  test do
    assert_match "hp (hittyping)", shell_output("#{bin}/hp-beta --version")
  end
end
