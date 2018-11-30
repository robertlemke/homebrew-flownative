#
# DO NOT EDIT THIS FILE MANUALLY
#
class BeachCli < Formula
  desc "Command line tool for Flownative Beach"
  homepage "https://www.flownative.com/beach"
  url "https://storage.googleapis.com/cli-tool.beach.flownative.cloud/beach-0.9.5.phar"
  sha256 "9905091f99a2dab3ef2d73127a3e595cadbc81a145659239e3e986f603ed6a34"

  head "https://storage.googleapis.com/cli-tool.beach.flownative.cloud/beach-master.phar"

  bottle :unneeded

  def install
    system "php", buildpath/"beach-0.9.5.phar", "localbeach:prepare", "#{lib}/beach-cli/localbeach", "~/Library/Application Support/Flownative/Local Beach/MariaDB"
    bin.install "beach-0.9.5.phar" => "beach"
  end

  plist_options :manual => "beach localbeach:start"

  def plist; <<~EOS
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>RunAtLoad</key>
      <true/>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/beach</string>
        <string>localbeach:start</string>
      </array>
    </dict>
  </plist>
  EOS
  end
end
