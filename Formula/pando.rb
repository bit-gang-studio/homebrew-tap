class Pando < Formula
  desc "Pando on the command line: list, add and remove git worktrees"
  homepage "https://github.com/bit-gang-studio/pando"
  version "0.1.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.8/pando-cli-aarch64-apple-darwin.tar.xz"
      sha256 "8ba348dcb879c839806c5e3e474d5d67b094d437c2d1feca532caeeefdcb1de0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.8/pando-cli-x86_64-apple-darwin.tar.xz"
      sha256 "a1171038f4ec45d01364fa11ce92e445d47112ca2635447b6b447002c43baea5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.8/pando-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4c381f000520501b2b911b6a524aa8ee8c7a4ef571a6f89dfd3e6f307a9b8aec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.8/pando-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "98bc28f8beb30ebffe37df001193b63461f354a8b72b562b056b702bb3fd1499"
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
