class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.10.0/siggy-v1.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "35c1638c8395e133926fd144c15c400e4211c23c8199432899fead67de218d42"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.10.0/siggy-v1.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "0a1352733c3657e8660b0bbeb16e2b07106953633c47de3c4d08b68613d06605"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.10.0.tar.gz"
    sha256 "2214519d9268fa747030b7423dd699d87eb6e031e432fbc32958ce42f828e3b9"
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
