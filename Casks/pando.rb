cask "pando" do
  version "0.1.10"
  sha256 "4968091f854c1c3dbd62a20bf9c295024a1936682250b44106427afd79db3c2f"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
