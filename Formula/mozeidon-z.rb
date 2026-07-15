class MozeidonZ < Formula
  desc "Control Firefox/Chrome from the terminal — Mozeidon-Z CLI"
  homepage "https://github.com/colangelo/mozeidon-z"
  version "5.2.1"
  license "MIT"

  depends_on "colangelo/tap/mozeidon-z-messaging"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-arm64"
      sha256 "cf1cd30414c05a1b8e2984367c23fea0efc1528b3d96e36ba76b3ac50aec40da"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-amd64"
      sha256 "9773d90fad7d04f77fe3fba712d97ecb920003fd12527febeea964513cf0a530"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-arm64"
      sha256 "9528cebd981df6a5037264430ab8ce972de4743de241db164f1b44bb1ef27886"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-amd64"
      sha256 "bf6e5e49b43b8f2c2d876c5acb9cfe8f293b8759c0a7f2f496406c5c57dac22c"
    end
  end

  def install
    binary = Dir["mozeidon-z-*"].first || "mozeidon-z"
    bin.install binary => "mozeidon-z"
  end

  test do
    assert_match "mozeidon-z version", shell_output("#{bin}/mozeidon-z --version")
  end
end
