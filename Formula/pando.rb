class Pando < Formula
  desc "Pando on the command line: list, add and remove git worktrees"
  homepage "https://github.com/bit-gang-studio/pando"
  version "0.1.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.5/pando-cli-aarch64-apple-darwin.tar.xz"
      sha256 "24b6d6934396f112e0172e4defb260cbf395e42d6af0a16a4b3abacd0ed125ef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.5/pando-cli-x86_64-apple-darwin.tar.xz"
      sha256 "e0ce0b666a966dd2465ba2e5820a6d371664e067ca91b33e81c6aac9a4ef63b5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.5/pando-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0af9c271a6de9ac1b0b15de74186d65cbfb5bdc13ada001d4f0374f1cd7e1fdd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.5/pando-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d3529c3c9a05ca794ee17ae9e35d6bbe3fae3c09020a32e0416f7ee1d79beab3"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "pando"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "pando"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "pando"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "pando"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
