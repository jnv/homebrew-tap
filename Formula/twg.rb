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
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.3.6"
      sha256 "77435bb7600b031f6135056dcdd3a47cda866279fbbe718906b446d7b4714c67"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.3.6"
      sha256 "e0b48818c70aa475a4a8a81765deb2e6eaa947a965cdce37beb4c88e94dea0e3"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.3.6"
      sha256 "a86bc3aa61366230377d6a11a1635501ea162b236ef481a80a337fcd93a12f55"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.3.6"
      sha256 "ac8ef5cdfa361baf1ff05d1d0f874447cc9562e620dd9aafdeef5ac2913a3778"
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
