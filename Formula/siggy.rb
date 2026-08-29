class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.14.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.3/siggy-v1.14.3-aarch64-apple-darwin.tar.gz"
      sha256 "2ab542183b04de6bf74d996af5a09353df56099c7535056a61e0df43d4c6ae77"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.3/siggy-v1.14.3-x86_64-apple-darwin.tar.gz"
      sha256 "97a3be382c57118e6e3cf0c4888c2fb66248b0848cdf24598aaf1a7c9afe7ef3"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.14.3.tar.gz"
    sha256 "adeae3eaeebe665bac1c6d0f61f0ff0916aa475284476f7c3ef89c3a5ba85129"
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
