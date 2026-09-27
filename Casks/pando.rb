cask "pando" do
  version "0.1.0"
  sha256 "0c8f4675caf0ffe4c8271f5b5b0ae6f6b7dd37b2c0fd3d4bc3bbd8811e76aca3"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
