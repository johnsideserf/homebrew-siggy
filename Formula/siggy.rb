class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.6.0/siggy-v1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "cafc87bb6d8509d76cde7dd0abda556aebc743e2fa3e73d9b49195b175623db0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.6.0/siggy-v1.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "cc43a70e7f9b0ce89df08d16b0df50606ce9bd8134438d19d98a80f90e86a4fb"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.6.0.tar.gz"
    sha256 "87eba28668442715af88fe4634f252e5d28c81c90518a50bd97a0f43c1d26482"
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
