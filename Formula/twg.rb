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
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.4.3"
      sha256 "c5bddef0df90040de1c094fa54a36fff4c21e5fb5071eb1a9d458fb1922caf62"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.4.3"
      sha256 "9683ffa5e7dae9c26fd9838cd7dcaf8f99d6de1d921a1a1d76ffb2fce340a124"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.4.3"
      sha256 "bac5d8b219df1f2a7ba71f97f1df6cba45e5b2f12b235fdeb973b763126e3e96"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.4.3"
      sha256 "f86458f43efaa5332bbee90d535643fdf6dc113982e272637bdfff1512f594a1"
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
