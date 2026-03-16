class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.5.1/siggy-v1.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "545290a1dad86053c56174b4f9d0dc1a97f8ef385b6e6e80dbaf4f27ec564e21"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.5.1/siggy-v1.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "c10d834c35cc3131f8a68f0fc3ff7f12e339c61877569c642086fb6c864408ce"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.5.1.tar.gz"
    sha256 "84105115bbada8fd4002077330953586fcae77afb4437d5ab121526a88daccdd"
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
