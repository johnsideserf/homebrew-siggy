class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.14.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.1/siggy-v1.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "7b86909c1cb7f1ba1932e7c266e7f1960aff8f311d40bc87ea263b889508d37c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.1/siggy-v1.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "bf78a80ac7e913342e5cf353e90b7dad28a26a2eef0389c08c632de1aa534191"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.14.1.tar.gz"
    sha256 "154c02db19f5cadb91d9556bbd9f62ec48d5525dff76f4165a7d2d5fd6454ff6"
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
