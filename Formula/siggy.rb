class Siggy < Formula
  desc "Terminal-based Signal messenger client"
  homepage "https://siggy.chat"
  license "GPL-3.0-only"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.5.0/siggy-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "b589b66acfabd17e10848619ec0fa1db900b02eed72ef6b0c59794d93e211b25"
    end
    if Hardware::CPU.intel?
      url "https://github.com/johnsideserf/siggy/releases/download/v1.5.0/siggy-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "62467818be3b016073e3db159749a6e8aefcb5728e84c30696838a2a1a3bec70"
    end
  end

  on_linux do
    url "https://github.com/johnsideserf/siggy/archive/refs/tags/v1.5.0.tar.gz"
    sha256 "2002744bd7300dcc250f4b395f94fca03a519454547df3ce96cb24fe4eeddf6c"
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
