class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.14.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.2/siggy-v1.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "9f4a3c318ab4dffcea613937efea9af40f6ebf9c66a1a2c76bd1e5f262916f9c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.14.2/siggy-v1.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "16bae97573089cbafbc86f148035b4e962c585f37f122b66034968d71f76d67c"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.14.2.tar.gz"
    sha256 "88254433e59240c0bb7baa0c8392e23b4be76cfea5c1c17dd80966888b553434"
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
