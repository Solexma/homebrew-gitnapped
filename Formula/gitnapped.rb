class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  url "https://github.com/solexma/gitnapped/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ef506c617d614e66c1d56d7a693b3b3f8c83326d1bd9bdd4f8416652250a569c"
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
