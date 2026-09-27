cask "pando" do
  version "0.1.2"
  sha256 "0278f312c18eb135271745b40360b7a198f3679a76b85d10f6565babc62f11ce"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
