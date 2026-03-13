class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.4.2/siggy-v1.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "e3aecfd29347862a5e275903a1866bc690e95153bbe030e323e973758446efdd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.4.2/siggy-v1.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "27371305c5cd74b36d28aaa39e74f730eb724e15e6cb19fc50a9030f29520875"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.4.2.tar.gz"
    sha256 "72d2f82d4da370a1f0273953f4b5adb7e79d1136b2a50c17a31106aa4b4d4cb8"
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
