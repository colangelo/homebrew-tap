class Hp < Formula
  desc "Prettyping-style HTTP(S) latency monitor"
  homepage "https://github.com/colangelo/HittyPing"
  version "0.7.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-arm64"
      sha256 "e017fd87708ea6a0200bea8112b5e0dc8749536d0f891df8167945a13044c574"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-darwin-amd64"
      sha256 "91ac7654c20aca009ca5f458f29ed86e106bb587b5ce9394726095aed2936c2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-arm64"
      sha256 "ba45c181e02793c72a5a764fbecb321a016f20ae799577aba6201c11e957ecd0"
    else
      url "https://github.com/colangelo/HittyPing/releases/download/v#{version}/hp-linux-amd64"
      sha256 "58f6fbcbdabe4679ef469a029bca7460b6c129f36bdc5651c68630e1515394b1"
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
