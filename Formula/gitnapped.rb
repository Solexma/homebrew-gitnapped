class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "0.1.1"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Solexma/gitnapped/releases/download/v0.1.1/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "29b9241243cb3fc5d7bb42ab570b9a71c305713cf3615e09c9937aaa19c63ae2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "a2973da6050413d77a2f2d9ff1c97b488c33d2eaea22554fc1a61062f8707eee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4be8e9066e313bcfa1e9b0c8006a39ed11aa3c191fa8b40c81da957d3135f49b"
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
