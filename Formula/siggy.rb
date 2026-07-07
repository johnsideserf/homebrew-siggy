class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.0/siggy-v1.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "b20fd9452849a7e5422cfc3302d3d7fe816f708c41c8f6c13104d416e98f93d0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.0/siggy-v1.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "f20b587f629940e742b4196f24d5bb58a977f27ef7a7f8f50cbc54d65b3c4017"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.14.0.tar.gz"
    sha256 "b3769b43b0bbfb9e6b1958511ebb0a49bec12fa3762c60357adab0a19f1cd86f"
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
