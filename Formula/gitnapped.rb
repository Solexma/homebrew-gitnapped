class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  url "https://github.com/Solexma/gitnapped/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e2ccf481e55a88c6344010e8b79f209fd70feaa22c3ee0e2c7396f995fab1d0f"
  license "AGPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/gitnapped", "--version"
  end
end 
