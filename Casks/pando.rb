cask "pando" do
  version "0.1.1"
  sha256 "3217772dd52b9893213f4aa8e3ab644fa24057bcfa3841edf646200db39c8756"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
