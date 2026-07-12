class MozeidonZ < Formula
  desc "Control Firefox/Chrome from the terminal — Mozeidon-Z CLI"
  homepage "https://github.com/colangelo/mozeidon-z"
  version "5.0.6"
  license "MIT"

  depends_on "colangelo/tap/mozeidon-z-messaging"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-arm64"
      sha256 "2c2fa8b45ab9cacdc135ece1f5bfd53ba663588e55cff0e0f750f758b312e2aa"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-darwin-amd64"
      sha256 "e1d969c0703dcea4b4d965f1f6b5455b94fa8792d824e94e0d2c173d95d5b9a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-arm64"
      sha256 "3f9d131b513eb89d88ef287645cf64b93c76672a5817f0bd3b36140a7206e3c8"
    else
      url "https://github.com/colangelo/mozeidon-z/releases/download/v#{version}/mozeidon-z-linux-amd64"
      sha256 "947c23b7ab89a0f8efaeb2208acdde319a35fc6cb0ad2c336e6a595c20899a71"
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
