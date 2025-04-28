class Gitnapped < Formula
  desc "Find out why you didn't sleep — commit history across repos"
  homepage "https://github.com/Solexma/gitnapped"
  version "0.1.1"
  license "AGPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-x86_64-apple-darwin.tar.gz"
    sha256 "fbaa6c0d973e79ec1e773b7996c0ba78ac1c3b9dd9933fc173cb4a2dc1f2483e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-aarch64-apple-darwin.tar.gz"
    sha256 "ec73bbbdb7153cafdc4ef3ddb58f832feee6e61f9d177a44de30acf16a6bacb9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/solexma/gitnapped/releases/download/v0.1.1/gitnapped-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dbe3733a5f6060a84deb3f7377ea9682871288632f50830101019b0eb280006a"
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
