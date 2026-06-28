class MozeidonZMessaging < Formula
  desc "Native-messaging host bridging the Mozeidon-Z browser extension and CLI"
  homepage "https://github.com/colangelo/mozeidon-z-messaging"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-darwin-arm64"
      sha256 "bdb216dc05388823383a94d3be51d5b3c95c9888369a01b9c516c5798bafab6a"
    else
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-darwin-amd64"
      sha256 "bb2c3229d5c49c9874a1c1bacaab1cc95df6865cc0bbdba6c8e1cdae6ddc9aa0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-linux-arm64"
      sha256 "a4350a76b5987ac96b4399adea30751858b49ed7ff58dde986535a8605fbb5e1"
    else
      url "https://github.com/colangelo/mozeidon-z-messaging/releases/download/v#{version}/mozeidon-z-messaging-linux-amd64"
      sha256 "0c7b5535ce6428423b8f4b7a0646fd31e67e33bbbf085c505f228048aec87257"
    end
  end

  def install
    binary = Dir["mozeidon-z-messaging-*"].first || "mozeidon-z-messaging"
    bin.install binary => "mozeidon-z-messaging"
  end

  def caveats
    <<~EOS
      Firefox needs a native-messaging host manifest to launch this bridge.
      Homebrew can't write outside its prefix, so install it once per macOS
      user (the Mozeidon-Z toolbar popup shows "Disconnected" until you do):

        mkdir -p ~/Library/Application\\ Support/Mozilla/NativeMessagingHosts
        cat > ~/Library/Application\\ Support/Mozilla/NativeMessagingHosts/mozeidon_z.json <<'JSON'
        {"name":"mozeidon_z","description":"Mozeidon-Z native messaging host","path":"#{opt_bin}/mozeidon-z-messaging","type":"stdio","allowed_extensions":["mozeidon-z@a-layer.io"]}
        JSON

      Then install the Mozeidon-Z add-on from addons.mozilla.org. No Firefox
      restart is needed — the extension reconnects within ~1s.
    EOS
  end

  test do
    assert_match "mozeidon-z-messaging", shell_output("#{bin}/mozeidon-z-messaging --version")
  end
end
