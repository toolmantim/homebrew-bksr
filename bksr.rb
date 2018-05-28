require "language/node"
class Bksr < Formula
  homepage "https://github.com/toolmantim/bksr"
  desc "Run and test your Buildkite pipeline steps locally, just as they'd run in CI."
  url "$STABLE_URL"
  version "v2.3.0"
  sha256 "$STABLE_SHA256"

  bottle :unneeded

  depends_on "node" => :recommended

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
    libexec.install Dir["*"]
    inreplace Dir["#{libexec}/package.json"], '"installationMethod": "npm"', '"installationMethod": "homebrew"'
  end

  test do
    assert_match "bksr #{version}", shell_output("#{bin}/bksr --version 2>&1")
  end
end
