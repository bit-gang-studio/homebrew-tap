cask "pando" do
  version "0.1.9"
  sha256 "dc4400a8d1fc6228c704ce5cd139f4f92afeb30face2dc990a9eef21c5f6603c"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
