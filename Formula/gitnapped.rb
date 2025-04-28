class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "0.1.2"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.2/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "7a8932d96268d6a55a6d6d15d4a951f4006d4c774c721a1e0fbe85d7aed36ef0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.2/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "e7fbe1196313c669775200befbdb5e883c5ef40793a00880b99317cd3d8462df"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.2/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61b4a71c7393acef72263fe2551c89e3dd883b131eae87e7ce6570be8e36cc78"
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
