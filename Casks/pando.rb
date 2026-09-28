cask "pando" do
  version "0.1.3"
  sha256 "c4c61892998c74479ab2501c15e209a834d1c5b2b3dde9302a7fcd63a012a4c7"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
