class Pando < Formula
  desc "Pando on the command line: list, add and remove git worktrees"
  homepage "https://github.com/bit-gang-studio/pando"
  version "0.1.9"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.9/pando-cli-aarch64-apple-darwin.tar.xz"
      sha256 "90a938dcccf2d97ed84c7a48bc459531235355d42d6e6b9d10141782364e97e8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.9/pando-cli-x86_64-apple-darwin.tar.xz"
      sha256 "d249e4f2854f05c3dc04ad2dbea18bf4b7b125fc556aa135ba58d9086d308a79"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.9/pando-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4e5a769271b95cb9fd60c9718c25f1cab60e9178784a933cf351fe591ab4f558"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.1.9/pando-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "98c088c9a46aeec859519faaf5613327785f4fb7fc4a6aba70a828efd8c8acce"
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
