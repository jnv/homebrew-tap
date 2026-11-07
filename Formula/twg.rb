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
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-arm64-v1.4.4"
      sha256 "a34270ee07ac8a701dbab3f8be669ac640e575fdc85758d5c56846975a7dceec"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-darwin-x64-v1.4.4"
      sha256 "c6081730886a4c920377fa17c0e2d674fa50ec6a4b4d379ebfb2ef78c454bebd"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v1.4.4"
      sha256 "4dab6d4fbc94e450fc79e661ac48616ba1099b40077dedc550d4d105e1cb83cc"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v1.4.4"
      sha256 "36a93b0ad0011d80909cc00508091c34df03dd0bf1644fded67bf94f2c9ffc07"
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
