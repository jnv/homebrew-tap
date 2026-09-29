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
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.3.3"
      sha256 "7623885dffa27e85882c4e7dfeff1667538f0899dccd8f1180ca64c58fc1ad67"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.3.3"
      sha256 "36a81f378065d7f2fe7a19082b7ab3cd9d23d543b7a462ce93e4ef299ec6ff6e"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.3.3"
      sha256 "a18bc47d8cb445fbf7e40e3dbbbf049efad4dc455b627dad26505caad4f21705"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.3.3"
      sha256 "f2b27de35e2b70ca533dc544b6d41df3013743d7e4a1dcf113498528f9a38401"
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
