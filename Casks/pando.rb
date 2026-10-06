cask "pando" do
  version "0.1.12"
  sha256 "b18529554e9f777b63cc4d560708f3e8336568836412790becbd5a1804524f5d"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
