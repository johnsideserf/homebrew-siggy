class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.15.0/siggy-v1.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "1fa29e7c93f27d7cb8e30842d16fb32066a5dcc89179a54de18244c90df5073c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.15.0/siggy-v1.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "ad29f09681f32a80dca034a0c9b41ce4ba956df76c6dbc913858b6f351f49e7c"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.15.0.tar.gz"
    sha256 "5896074797a34b9b62580077f8a0cf0bb78cafb6e0c2c3977ecf2f063a41bda2"
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
