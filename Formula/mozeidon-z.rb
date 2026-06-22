class MozeidonZ < Formula
  desc "Control Firefox/Chrome from the terminal — Mozeidon-Z CLI"
  homepage "https://github.com/colangelo/mozeidon-z"
  version "5.0.3"
  license "MIT"

  depends_on "colangelo/mozeidon-z-messaging"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-arm64"
      sha256 "dc60b1ab2eb7b49c147b1220816a629c0689138e0cb0ed70a3251c0272a750d6"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-amd64"
      sha256 "dd95a35d0928817bd6cafd1ce8caa45655c8cb4351a9bef77b3f8c403ef63767"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-arm64"
      sha256 "ade058441b277e9abcbbc66e0cd64227694d16c667091c7a27eff23b3de140df"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-amd64"
      sha256 "80f60a8f7d4f65a5e024e1542d019959dae8a975b79eaad6d7f2f1a45d7d244b"
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
