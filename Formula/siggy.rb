class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.8.0/siggy-v1.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "97f8bcc1462f57591a3d8a113422b3701f07c14092ec987fafc3d5d5e1425a01"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.8.0/siggy-v1.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "11f98e08556de7f1bdca4a6f65e8b1359bd233d5c0f9a8ce161d979aa09f2108"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.8.0.tar.gz"
    sha256 "197b706c927eaa4bd561e239a4ab9c7a679e9a644c2f5137d2555df1287e6634"
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
