class MozeidonZMessaging < Formula
  desc "Mozeidon-Z native-messaging host — browser ⇄ CLI IPC bridge"
  homepage "https://github.com/colangelo/mozeidon-z-messaging"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-darwin-arm64"
      sha256 "9d89c6f3c4b3b6fa2209a0c63c097d81e1c1f5c42faeaa7da97df90fd5599661"
    else
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-darwin-amd64"
      sha256 "7f21d7f9a98df7b23e9c8a8afb68173489be7cf6d9af85aca01cc1e12ced1b8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-linux-arm64"
      sha256 "ecd8a37434ab4e4d4eec6cc5cd085fa647e61e3f6f569d961bd8fdc98ab47507"
    else
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-linux-amd64"
      sha256 "0c1d9d57e389de04868d98ee41bd980157df22c5c4b831c2994a60ad1c3cc9b3"
    end
  end

  def install
    binary = Dir["mozeidon-z-messaging-*"].first || "mozeidon-z-messaging"
    bin.install binary => "mozeidon-z-messaging"
  end

  test do
    assert_match "mozeidon-z-messaging", shell_output("#{bin}/mozeidon-z-messaging --version")
  end
end
