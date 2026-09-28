class Pando < Formula
  desc "Pando on the command line: list, add and remove git worktrees"
  homepage "https://github.com/bit-gang-studio/pando"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.4/pando-cli-aarch64-apple-darwin.tar.xz"
      sha256 "51019bd03dc656fbe7c2db59fd888cbbb675aee1003580ea81c28009a7d55191"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.4/pando-cli-x86_64-apple-darwin.tar.xz"
      sha256 "966ebe157ef208b5a62470af6384a21035034742c30eef67fb8fd8ff2b1ebb8b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.4/pando-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "88fdb8ab4e00638c96fac0af1e0ef6f3d13b24695eb07456a673f14c6a501a65"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.4/pando-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9955196406141c9f41ee7746714cf7c0c80837ee300a864a3cae1b1e1c3e967d"
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
