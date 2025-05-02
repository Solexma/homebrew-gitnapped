class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "main"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/vmain/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "b4df958fafc49d8f6b3fab7bfc7e1ffb4f6a8c531f907480b48afe810fb5cd9e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/vmain/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "58498cb446715a4cf7198df0c6606ef4b5955310025d9c28bc05b9b420ed2e8b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/vmain/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fdaea622560b63150c1d0d469f95bf3d8ff3beb6f8c82b2f3b47ebf8db1974de"
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
