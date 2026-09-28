class Pando < Formula
  desc "Pando on the command line: list, add and remove git worktrees"
  homepage "https://github.com/bit-gang-studio/pando"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.3/pando-cli-aarch64-apple-darwin.tar.xz"
      sha256 "6109130b98d277b9223353db7c5d567d03b7777dcff02ac11cadf7a8d9aa6410"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.3/pando-cli-x86_64-apple-darwin.tar.xz"
      sha256 "804d89596ab515afe2209134405a2474af11efcfaaf1796d7814e67e198be21b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.3/pando-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f594c7dac98907b9217574e9dfbe552a95eaeac977143778f925d8463a6503b6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.3/pando-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4e317c0309d21945434fe5f2d9c2ef3e06e9d88a6c56d9a5dbc2f9eae1eac653"
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
