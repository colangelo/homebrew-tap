class HpBeta < Formula
  desc "Prettyping-style HTTP(S) latency monitor (beta channel)"
  homepage "https://github.com/colangelo/HittyPing"
  license "MIT"
  version "0.8.5-beta.20260228212909"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-arm64"
      sha256 "7c81844738100f0c2e46f019f4a4de6943c6a14b2a98cae8265118fb0c9bbde4"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-amd64"
      sha256 "463629d41d6b3a27be4e86c520e35e532b1bef3dcb4e5aabb6221f7f3c6bc1ae"
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
