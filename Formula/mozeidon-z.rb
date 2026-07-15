class MozeidonZ < Formula
  desc "Control Firefox/Chrome from the terminal — Mozeidon-Z CLI"
  homepage "https://github.com/colangelo/mozeidon-z"
  version "5.2.2"
  license "MIT"

  depends_on "colangelo/tap/mozeidon-z-messaging"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-arm64"
      sha256 "c7e81a787f5a2a2c56c29d8ebfd1499a4ac0796019e18f4c0f6d94c658053d23"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-amd64"
      sha256 "0cd173ebee68fce79dfe4bdf4b1bdaef209c65701757bba6f031e8df83d7e91e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-arm64"
      sha256 "dc5e8d11347809ed540a6fc39e3dfd162e0bcc00aec9158d21c5911705bd8f4d"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-amd64"
      sha256 "012e88f2618efb81e26e24cc35256040dc06228dbc17191e2432df937237e091"
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
