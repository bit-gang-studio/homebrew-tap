cask "pando" do
  version "0.1.5"
  sha256 "58d3a60a8ae0de4c684a9213bd989ec9146325a666d095ea67ae2fb001dac905"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
