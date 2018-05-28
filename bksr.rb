require "language/node"
class Bksr < Formula
  homepage "https://github.com/toolmantim/bksr"
  desc "Run and test your Buildkite pipeline steps locally, just as they'd run in CI."
  url "https://registry.npmjs.org/bksr/-/bksr-2.4.0.tgz"
  version "v2.4.0"
  sha256 "a8cfb61caf78f442bd06ae9106d81f18184b2708f7b5cf3d4b7b96292c6a1788"

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
