class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "0.1.3"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.3/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "9dbe1f1feb0da6646dd9af04b2329f6abf525ecf08af193c0fc8120664c7beca"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.3/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "c10c5aea2c31efd73763dc095a7e29b2b578fb4e040a764ce2e397264ae38b2b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.3/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "23ea83bc94425a271f5d17f42a4a594d7b545b10c3bfc4e4c614120f6915ff6e"
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
