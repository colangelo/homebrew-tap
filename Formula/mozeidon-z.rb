class MozeidonZ < Formula
  desc "Control Firefox/Chrome from the terminal — Mozeidon-Z CLI"
  homepage "https://github.com/colangelo/mozeidon-z"
  version "5.0.4"
  license "MIT"

  depends_on "colangelo/tap/mozeidon-z-messaging"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-arm64"
      sha256 "cb53a2d67f8f7425d17d22eb7a495482d1d38d16f586815d687b8ef31415b113"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-amd64"
      sha256 "1555ad427dd4681d86b74ad366c9b6ea08d9016b99bca4dcedf48d1af713026f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-arm64"
      sha256 "40449341d893c9e02fee8d7377cc362b41c5fb9f1dfa165ccb06d1f60f412501"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-amd64"
      sha256 "bf0069fdb8659e01b2e8f6d556313764f56be464efd1628b3a253fcb88c0a5ca"
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
