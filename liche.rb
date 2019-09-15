# XXX: This is probably terrible way to approach this,
# because go dependencies are fetched during build and not versioned.

class Liche < Formula
  desc "Fast Link Checker for Markdown and HTML in Go"
  homepage "https://github.com/raviqqe/liche"
  head "https://github.com/raviqqe/liche.git"

  depends_on "go" => :build

  # https://kevin.burke.dev/kevin/install-homebrew-go/
  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/raviqqe/liche"
    # Copy all files from their current location (GOPATH root)
    # to $GOPATH/src/github.com/raviqqe/liche
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "get", "-d", "-v"
      # Install the compiled binary into Homebrew's `bin` - a pre-existing
      # global variable
      system "go", "build", "-o", bin/"liche", "."
    end
  end

  test do
    system "#{bin}/liche"
  end
end
