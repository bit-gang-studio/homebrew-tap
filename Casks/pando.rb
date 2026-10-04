cask "pando" do
  version "0.1.6"
  sha256 "07ad6925c85b4f3822ca4750547da514fa254b34bd10c331c9717129138c94bb"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
