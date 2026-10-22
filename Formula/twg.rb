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
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.3.9"
      sha256 "20121ce59afba78be83866f42fd44705e8c5c446ce881567b82b0057d906de90"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.3.9"
      sha256 "d3796268469cb0ccc1a9c7337758887ebd53fee8065ff96834d857e49ea48f3f"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.3.9"
      sha256 "00a5b2127acd3717ebeb93196b56db84d56165fa121e7fcde6d51a28f2f04144"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.3.9"
      sha256 "66a12bd584282ec56d79663da6257358779512bb656c55094fb3835c65be1df3"
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
