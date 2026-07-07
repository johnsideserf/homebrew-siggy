class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.13.0/siggy-v1.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "d0d8f0fb75f3ecb4ff07d732a6cb46bce01ee0ea3a0104d4e1416c95a17e1197"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.13.0/siggy-v1.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "65120143073d113fa91569c4186e3a30d7bcb38c1ab45e27ebace3764cdc4906"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.13.0.tar.gz"
    sha256 "0861457616d2a7da7dd0b94f96c6f7f79e9a69b1dea15401e761dacaa68f6281"
    depends_on "rust" => :build
  end

  def install
    if build.head? || OS.linux?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "siggy"
    end
  end

  test do
    assert_match "siggy", shell_output("#{bin}/siggy --version")
  end
end
