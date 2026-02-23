class HpBeta < Formula
  desc "Prettyping-style HTTP(S) latency monitor (beta channel)"
  homepage "https://github.com/colangelo/HittyPing"
  license "MIT"
  version "0.8.3-beta.20260223165255"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-arm64"
      sha256 "cbc6bf047f20d5e622b45209ec68dc38983a735dc5d7fbc61fa378526a0f4871"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-amd64"
      sha256 "91901bc74fe2485a1f53ace19b52e63e2cc82fb1de8a8b56705560d10992b882"
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
