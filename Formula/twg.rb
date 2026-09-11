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
      sha256 "f8e64f1e096f03d458b80a083c714c8edfa79c3d6befde8e64356ca5318c653d"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.2.8"
      sha256 "fc4afabed3086f2b63ee82b1304042a66954179f1ec567bc33b01901d65791bf"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.2.8"
      sha256 "425eaeb911f09510ea8fbaa0231e987387881d198efffe625ce41a005fca40f5"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.2.8"
      sha256 "2ce21df22797b6323be31e1cabc8fa1f772251d67136de315c2761628134781d"
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
