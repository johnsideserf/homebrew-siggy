class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.7.1/siggy-v1.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "91ae533293aa171b7e42a0fa46941ec9238eef4ff0750f7348d533020432023d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.7.1/siggy-v1.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "f81a0cae1eea4283a4ccc7c9120ab90d4ba8e17af9ab5c2a408d64083b4426f0"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.7.1.tar.gz"
    sha256 "aabedbb5d6f9c58551e66ab572b20093d3d3c0e09f161f12c128ca372495be84"
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
