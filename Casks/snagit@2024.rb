# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "snagit@2024" do
  version "2024.4.8"
  sha256 "731df99a46b41982cdcb7a6d28802a28e278c2d4cc47ce1907103a698b1b0414"

  url "https://download.techsmith.com/snagitmac/releases/#{version.major[-2..]}#{version.minor_patch.no_dots}/snagit.dmg"
  name "Snagit"
  desc "Screen capture software"
  homepage "https://www.techsmith.com/screen-capture.html"

  livecheck do
    url "https://www.techsmith.com/api/v/1/products/getallversions/100"
    strategy :json do |json|
      json.map do |item|
        next if item["Major"].blank? || item["Minor"].blank? || item["Maintenance"].blank?

        "20#{item["Major"]}.#{item["Minor"]}.#{item["Maintenance"]}"
      end
    end
  end

  depends_on macos: ">= :sonoma"

  app "Snagit 2024.app"

  zap trash: [
    "~/Library/Caches/com.TechSmith.Snagit*",
    "~/Library/Group Containers/*.com.techsmith.snagit",
    "~/Library/Preferences/com.TechSmith.Snagit*.plist",
    "~/Library/Preferences/com.techsmith.snagit.capturehelper*.plist",
    "~/Library/Saved Application State/com.TechSmith.Snagit*.savedState",
    "~/Library/WebKit/com.TechSmith.Snagit*",
  ]
end
