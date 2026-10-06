cask "pando" do
  version "0.1.11"
  sha256 "f573e084370b3c685fc9904a8ec7a79cf56ec5a3b38d46610e85831ee0af3de2"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
