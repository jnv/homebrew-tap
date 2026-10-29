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
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.4.2"
      sha256 "5bf0af700075365955ad4f8d92973a82008f6c2b3f7e607e39a647057b340784"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.4.2"
      sha256 "c4df9f7a2fe88eee5996d67dd179b54c9d2121b837f07cf5f58a72b613862ea2"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.4.2"
      sha256 "c5bd21ea94eaa95446897b1eee072b38af60da2c88056120ae2294aade79f2c0"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.4.2"
      sha256 "086662c6aa0d9e3d86c9f2f000115b8cc248d63152ab1f93e222e95515d05200"
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
