cask "pando" do
  version "0.1.4"
  sha256 "978a4f2802f25d65e9a9e5a8cad21df1cdb0d163fe776e1c5b39fa0bec0efb5c"

  url "https://github.com/bit-gang-studio/pando/releases/download/v#{version}/Pando_#{version}_universal.dmg"
  name "Pando"
  desc "Simple, honest Git GUI where worktrees are first class"
  homepage "https://github.com/bit-gang-studio/pando"

  auto_updates true

  app "Pando.app"

  zap trash: "~/.config/pando"
end
