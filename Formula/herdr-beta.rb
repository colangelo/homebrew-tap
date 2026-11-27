class HerdrBeta < Formula
  desc "The old herdr-beta command, now a link to herdr-max"
  homepage "https://github.com/colangelo/herdr-max"
  version "0.12.1"
  license "AGPL-3.0-or-later"

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/colangelo/herdr-max/releases/download/beta/herdr-macos-aarch64"
    sha256 "382796e882ccb55288fbe85aeca0984e7235d71e0f4b39806cf747fc5447b751"
  end

  depends_on "herdr-max"

  def install
    # An absolute link into opt, not install_symlink: that one resolves opt to the
    # versioned keg, which a later `brew upgrade herdr-max` alone would delete.
    bin.mkpath
    (bin/"herdr-beta").make_symlink Formula["herdr-max"].opt_bin/"herdr-max"
  end

  def caveats
    <<~EOS
      herdr-beta is now herdr-max; this formula only keeps the old command
      working as a link to it. Use herdr-max, and drop this one when nothing
      calls herdr-beta any more:

        brew uninstall herdr-beta
    EOS
  end

  test do
    assert_match "herdr-max #{version}", shell_output("#{bin}/herdr-beta --version")
  end
end
