class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  url "https://github.com/solexma/gitnapped/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "57d17cb4bdfc2761249aa4bad7b1de6ec38960299c4431ce8474344a30ed97bb"
  license "AGPL-3.0-or-later"
  version "v0.1.1"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gitnapped", "--version"
  end
end 
