class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.9.1/siggy-v1.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "de13dec7f6cc9dc4dac344b80f8a67dc20966955f03fca0135a968f597d66356"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.9.1/siggy-v1.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "da792de4c1d628b77edca48fe3d63c4fee1abfdd0705352cd5b2260862eb6dcc"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.9.1.tar.gz"
    sha256 "ee596996d5667609e8c480742b627e6725728d5e966b53a27f695f22c1302a33"
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
