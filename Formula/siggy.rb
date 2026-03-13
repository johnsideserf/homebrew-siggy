class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.4.1/siggy-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "d04dd22b4d020bab0a2e040e513ccf553c1d72370efba164a4a9a300a8bdae6b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.4.1/siggy-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "f4dafaeb751f382c4e99f026773ccb6368e3bd2323fb58ff106838e5e9ae12a4"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.4.1.tar.gz"
    sha256 "9cf4d738157bea0e787ff02cde74f72139044467c64cba0a62131ee9fa59a2d8"
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
