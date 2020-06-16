class Arcanist < Formula
  desc "Phabricator Arcanist Tool"
  homepage "https://secure.phabricator.com/book/phabricator/article/arcanist/"

  # Use macOS's built-in php because brews' depends on broken curl-openssl
  # depends_on "php"

  head "https://github.com/phacility/arcanist.git"

  def install
    libexec.install Dir["*"]
    prefix.install Dir["*"]
    bin.install_symlink libexec/"bin/arc" => "arc"

    # Disabled since apparently arc is trying to be smart now and installs itself via arc shell-complete
    #cp libexec/"resources/shell/bash-completion", libexec/"resources/shell/arc-completion.zsh"
    #bash_completion.install libexec/"resources/shell/bash-completion" => "arc"
    #zsh_completion.install libexec/"resources/shell/arc-completion.zsh" => "_arc"
  end

  test do
    system "#{bin}/arc", "help"
  end
end
