cask "proxyman@4.14.0" do
  version "4.14.0,49500"
  sha256 "8bff067918a9da0bb8f195c67bb4925be6927b4971e1cbcc6de85375065afd0f"

  url "https://download.proxyman.io/#{version.csv.second}/Proxyman_#{version.csv.first}.dmg"
  name "Proxyman"
  desc "HTTP debugging proxy, pinned to 4.14.0 (49500)"
  homepage "https://proxyman.io/"

  # Pinned on purpose. Disable "Check for updates automatically" inside the app.
  auto_updates true
  conflicts_with cask: "proxyman"

  app "Proxyman.app"
  binary "#{appdir}/Proxyman.app/Contents/MacOS/proxyman-cli"

  uninstall launchctl: "com.proxyman.NSProxy.HelperTool",
            quit:      "com.proxyman.NSProxy",
            delete:    "/Library/PrivilegedHelperTools/com.proxyman.NSProxy.HelperTool"
end
