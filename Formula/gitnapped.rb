class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "main"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/vmain/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "3299dc2c30a441ff5cc551f2932dcfae46825720544590efe6d103529c295417"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/vmain/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "9e2e574bdfb47c6ef7130fcea9d7bf7cb40f77bd386fd55f9cd8e2715208c4b0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/vmain/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 ""
  end

  head do
    url "https://github.com/solexma/gitnapped.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "gitnapped"
    end
  end

  test do
    system "#{bin}/gitnapped", "--version"
  end
end 
