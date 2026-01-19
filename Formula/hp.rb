class Hp < Formula
  desc "Prettyping-style HTTP(S) latency monitor"
  homepage "https://github.com/colangelo/HittyPing"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-arm64"
      sha256 "a06665582018305b75961a771cf959ae15e73c3943a27ecb01a3c7714fbfeb39"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-amd64"
      sha256 "ed2430f9c50e86e535415593ba8ebb346a5970ed6962739cbc42688026c0b970"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-arm64"
      sha256 "4be26d5fe6795007050b6eb6aa58a68504870a75c67a801674c0764452e113cb"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-amd64"
      sha256 "2ebbc3e04aa46d8cce1b92b3f75accaee5fe91c555fbe752134d204aecbbb1e8"
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
