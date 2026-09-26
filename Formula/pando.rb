class Pando < Formula
  desc "Pando: the worktree-native git client (CLI)"
  homepage "https://github.com/bit-gang-studio/pando"
  version "0.0.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.0.1/pando-cli-aarch64-apple-darwin.tar.xz"
      sha256 "3adb15815638603dcf395fe96ddfc9fcadc04b3850e5268b8ac13cb0a860fe64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.0.1/pando-cli-x86_64-apple-darwin.tar.xz"
      sha256 "8e66dc0342f52129933a8b85efb414ccfa463fb81acfed7ee278a54fc07bc8ed"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.0.1/pando-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "791133859b6709138782ec4e5581662a39e39537f9be61f3927fccbc86a34640"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bit-gang-studio/pando/releases/download/v0.0.1/pando-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e11f26260ed395080fbee4c5dcf369a02174ca3cc852844cc09526de2420b91e"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {}
  }

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
