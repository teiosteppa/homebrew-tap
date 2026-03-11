# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "equibop" do
  version "3.1.6"
  sha256 "bd6c7fc283844164caadbba3802c392433da4d930fa4ad1811a8998fb541b1d3"

  url "https://github.com/Equicord/Equibop/releases/download/v#{version}/Equibop-#{version}-universal.dmg"
  name "equibop"
  desc "Custom Discord app with a wide selection of plugins"
  homepage "https://equicord.org/"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://github.com/Equicord/Equibop/releases/download/v3.1.6/latest-mac.yml"
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
