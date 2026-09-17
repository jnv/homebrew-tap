class Twg < Formula
  desc "Atlassian Teamwork Graph CLI"
  homepage "https://teamwork-graph.atlassian.com/cli/AGENTS.md"
  license :cannot_represent

  livecheck do
    url "https://teamwork-graph.atlassian.com/cli/install"
    regex(/DEFAULT_VERSION=["']?v?(\d+(?:\.\d+)+)["']?/i)
  end

  on_macos do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.2.8"
      sha256 "5f5855e5ed47997c83477e8e7dc6c727821947b8668a7f19b4f4e9f12eb3f5f1"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.2.8"
      sha256 "bdca5c5637796f87d137a613c381eb5c74a4fdc9976d9ad4850809531f944fe9"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.2.8"
      sha256 "09c5c6e4c4cda20d0d73f6710f852a7c6798c5ab0da535f1e23c8152cc9e9c08"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.2.8"
      sha256 "25076b3989e0df75601d39ff24e22b41a1c9e330907cd2208843d1b4c22ff0ce"
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
