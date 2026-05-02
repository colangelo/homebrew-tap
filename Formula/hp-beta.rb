class HpBeta < Formula
  desc "Prettyping-style HTTP(S) latency monitor (beta channel)"
  homepage "https://github.com/colangelo/HittyPing"
  license "MIT"
  version "0.8.6-beta.20260502083356"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-arm64"
      sha256 "46bade2c75320442258f64bd7b5032c9b54bfd03745df8081a1b4f7f4689e95a"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-amd64"
      sha256 "f1636e87804533d32a6bbf89fd57b6cbe6067ece1e95de651759ec9171400b81"
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
