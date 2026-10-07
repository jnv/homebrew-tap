class Twg < Formula
  desc "Atlassian Teamwork Graph CLI"
  homepage "https://developer.atlassian.com/cloud/twg-cli/"
  license :cannot_represent

  livecheck do
    url "https://teamwork-graph.atlassian.com/cli/install"
    regex(/DEFAULT_VERSION=["']?v?(\d+(?:\.\d+)+)["']?/i)
  end

  on_macos do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.3.5"
      sha256 "bc8d9e07ba9275c2dffeda555f301828782c4972a9387dc221fe3cd3e9e33098"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.3.5"
      sha256 "11e7d286ebb2734ec2f4452b42b13754c5eb65b2fbaa8afe9c8a06cb1e9da08a"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.3.5"
      sha256 "b226f6e52f8137a2a3562c172d3a8b608a72bbb9078af845c3618468ea1170f0"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.3.5"
      sha256 "d66d93220f440f006279c6687274ed4c924835da4ec205cc818bc17f6dd91c08"
    end
  end

  def install
    bin.install Dir["twg-*"].first => "twg"
  end

  def caveats
    <<~EOS
      Run `twg setup` once to authenticate, then `twg doctor` to verify.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/twg -v")
  end
end
