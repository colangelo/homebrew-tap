class HpBeta < Formula
  desc "Prettyping-style HTTP(S) latency monitor (beta channel)"
  homepage "https://github.com/colangelo/HittyPing"
  license "MIT"
  version "0.8.2-beta.20260217175241"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-arm64"
      sha256 "cd75f97faed606b5829f1b66a90ea3675d14d8d2eaecebb7728e7f6382b5d1b2"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/beta/hp-darwin-amd64"
      sha256 "acc4b0834486bcaa701bc9bdc52abe0485dad2c6e40e64a9ffa557600b26bc97"
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
