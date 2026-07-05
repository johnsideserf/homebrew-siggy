class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.11.0/siggy-v1.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "733ecbb0b9adf2ae7c1b931ae6c837f801e1ae863b8aff618350239262ee4d5e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.11.0/siggy-v1.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "976f77784f3d39795c99301b806ecabce413eac7d3c4649211bba4cff4fe0957"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.11.0.tar.gz"
    sha256 "d5e638cfec12679aeac67ce8790a4d356b2bd41e80eec7f9f21a7d1a15e0947c"
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
