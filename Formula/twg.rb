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
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.3.8"
      sha256 "102f7865c98d94ead0ff799bdd556ca1d5e78240d4a431bd67e0f36dccb45124"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.3.8"
      sha256 "c79797c734520a37b74993558fa99e76923b42dbbdfa0ee9b99e0aa377764638"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.3.8"
      sha256 "4d2c67ab5ebc2fb83fc82db6f688d1e986ba44524278a8a4d442fbd747a01bfa"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.3.8"
      sha256 "c9f59f80ea63dec4a91b742717650af97629f5773cd63aee97bc4cabd2117361"
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
