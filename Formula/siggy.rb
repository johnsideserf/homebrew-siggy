class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.9.0/siggy-v1.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "fc3ba75d2730c4526903bd038b595e33a320a4de075ee6af932922a4947eccef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.9.0/siggy-v1.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "609782203e018fc28b9be5ad28fb2650e8de2d54e756a2eb5742bad26ad28ea2"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.9.0.tar.gz"
    sha256 "2c36b3e25f69459b2db58ec448096142c1a610ea165e7079676f6673a417dbc4"
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
