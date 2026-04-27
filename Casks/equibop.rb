# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "equibop" do
  version "3.2.0"
  sha256 "36a2e6a0ee26864f613eb10b21cde52f08312cd8f6c2faf463518b9385527f78"

  url "https://github.com/Equicord/Equibop/releases/download/v#{version}/Equibop-#{version}-universal.dmg"
  name "equibop"
  desc "Custom Discord app with a wide selection of plugins"
  homepage "https://equicord.org/"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://github.com/Equicord/Equibop/releases/download/v#{version}/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on macos: ">= :monterey"

  app "Equibop.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/Library/Application Support/equibop",
    "~/Library/Caches/org.equicord.equibop",
    "~/Library/Caches/org.equicord.equibop.ShipIt",
    "~/Library/HTTPStorages/org.equicord.equibop",
    "~/Library/Preferences/org.equicord.equibop.plist",
    "~/Library/Saved Application State/org.equicord.equibop.savedState",
  ]
end
