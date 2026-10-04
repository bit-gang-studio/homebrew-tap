cask "pando" do
  version "0.1.7"
  sha256 "e0531643851631ab718b2d76ed0764ff19165917c3a58511c00ec6c2294a4a65"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
