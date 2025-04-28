class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "0.1.1"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "2ce1e201be650bcd25aec60c37890aec676c2bff29195b1af4abaf76fc615df0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "537456af3ea3bbc5c78b7d817538b0c6f97d812167118e2d3662bf98cf53a6fc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e1f1689ed9d4d56ea7b60cc22a2610982251e605d4be3e5f81d7633e07dab449"
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
