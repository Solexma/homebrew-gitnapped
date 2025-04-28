class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "0.1.1"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "2727bf0719a1d273f29ee104865c5880341a50f55c6fcaf8b29d8fc39744f5c2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "6444b1076c019fcb28c6d415fcb390ce266bfa33791c4cbaecb75bf887fb8783"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c11645ec94b9c9ce96773f538fd878d8524c176fcbabdc7d69001eaac21d373"
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
