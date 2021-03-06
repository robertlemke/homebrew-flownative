# frozen_string_literal: true

#
# DO NOT EDIT THIS FILE MANUALLY
#
class BeachCli < Formula
  desc "Command-line tool for Flownative Beach"
  homepage "https://www.flownative.com/beach"
  url "https://storage.googleapis.com/cli-tool.beach.flownative.cloud/beach-0.12.0.phar"
  sha256 "a9af0234b1eafc6f63d47901e1e9a3ed039080b8b82e05f44447e4f97f4daa0e"

  head "https://storage.googleapis.com/cli-tool.beach.flownative.cloud/beach-master.phar"

  bottle :unneeded

  def install
    system "php", buildpath/"beach-0.12.0.phar", "localbeach:prepare", "#{lib}/beach-cli/localbeach", "~/Library/Application Support/Flownative/Local Beach/MariaDB"
    bin.install "beach-0.12.0.phar" => "beach"
  end

  plist_options manual: "beach localbeach:start"

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
