class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "0.1.4"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.4/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "e0c97222e0d56aa3c17fcd7aa59a6f8dffacf6e300d56443ebd96e7be703692e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.4/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "9444e2e9aee9f735c50e1975ab7775d6ebb6f965b20e4f8e8063d71602ab462c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.4/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ff7e0b3b94a287820619bfebfd73f7070f698cfa55879627d81b920a7478ecbb"
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
