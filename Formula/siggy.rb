class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.7.0/siggy-v1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "7db586f12b27553457af95e72f5434742d0225af1f17a3599556282aaaca7384"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.7.0/siggy-v1.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "07a17468f4856711c07bd70be3ca1e09b50b9d198b36caf2604b93a9f93e9891"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.7.0.tar.gz"
    sha256 "6208f791588bda72f8c46f7f266e42165941dc8802015cc4d99ca88c600c3630"
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
