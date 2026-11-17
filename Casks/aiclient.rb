cask "aiclient" do
  version "1.0.0"
  sha256 "ad117d9becd1823373ebccaa8b5be9ea42d159038e19d7e4c1dfb615ca3b4aee"

  url "https://github.com/rbc33/AIclient-macOS/releases/download/v#{version}/AIclient-#{version}.dmg"
  name "AIclient"
  desc "Chat client for self-hosted OpenAI-compatible model servers"
  homepage "https://github.com/rbc33/AIclient-macOS"

  depends_on macos: ">= :sonoma"

  app "AIclient.app"

  # La app va firmada ad-hoc y sin notarizar: sin quitar la cuarentena,
  # Gatekeeper no deja abrirla.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AIclient.app"]
  end

  zap trash: "~/Library/Preferences/com.ricardobenthem.aiclient.plist"
end
