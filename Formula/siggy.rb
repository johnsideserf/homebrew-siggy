class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.12.0/siggy-v1.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "677464fbb1d08c2b26cd5f1526101549992db2ce244758c2f0ced00ccc67bdd2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.12.0/siggy-v1.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "21e0784ccedcebf678635bdedbf2010e782240cd30b459a034b70c1a37859797"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.12.0.tar.gz"
    sha256 "9b4e93005ab2481fbea06787dd27b2ce52d6cbf23307367096f0f833a7bd3c70"
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
