class Bksr < Formula
  homepage "https://github.com/toolmantim/bksr"
  url "https://github.com/toolmantim/bksr/releases/download/v2.2.0/bksr-macos.zip"
  version "2.2.0"
  sha256 "68d3b262c1937a91ce06dae815623718457509353a848e3541e16dd2ce1ae1ba"

  def install
    mv "bksr-macos", "bksr"

    # Mark binary as installed from homebrew, so the bksr auto-updater can
    # figure that out and suggest `brew upgrade` if there's a new version
    system "xattr", "-w", "com.toolmantim.bksr:InstallMethod", "homebrew", "bksr"

    libexec.install Dir['*']
    bin.install_symlink libexec/"bksr"
  end

  test do
    assert_match "bksr #{version}", shell_output("#{bin}/bksr --version 2>&1")
  end
end
