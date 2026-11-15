class Hp < Formula
  desc "Prettyping-style HTTP(S) latency monitor"
  homepage "https://github.com/colangelo/HittyPing"
  version "0.8.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-arm64"
      sha256 "35c687961202696e882b6946f3dbbd35c0a05cf2c26a3208c7ab285498c02c46"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-amd64"
      sha256 "d250d02a719e608f02fc1eb40d99aaebfb8342c2037f5ef9707714daa61bda93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-arm64"
      sha256 "4c35820ced90c15df2e1a5962e837d87338c1ee2c9163c2b4413ed531526fbc9"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-amd64"
      sha256 "e80178d4e2df2e9a0c02e2d3cca74277c954fdec465c85f5dfc151bbd002c945"
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
