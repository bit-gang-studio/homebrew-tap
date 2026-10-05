cask "pando" do
  version "0.1.8"
  sha256 "0eb9856e0985ed5b3a8cca3533203e3a34dce3028fdba4e5fd1a7528058b9816"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
