#
# DO NOT EDIT THIS FILE MANUALLY
#
class BeachCli < Formula
  desc "Command line tool for Flownative Beach"
  homepage "https://www.flownative.com/beach"
  url "https://storage.googleapis.com/cli-tool.beach.flownative.cloud/beach-0.9.2.phar"
  sha256 "9c62e4ff5a77b7aba40d6a994de909dd945bd8ee9674779d94821d093365f02a"

  head "https://storage.googleapis.com/cli-tool.beach.flownative.cloud/beach-master.phar"

  bottle :unneeded

  def install
    system "php", buildpath/"beach-0.9.2.phar", "localbeach:prepare", "#{lib}/beach-cli/localbeach", "~/Library/Application Support/Flownative/Local Beach/MariaDB"
    bin.install "beach-0.9.2.phar" => "beach"
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
