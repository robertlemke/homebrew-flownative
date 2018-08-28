#
# DO NOT EDIT THIS FILE MANUALLY
#
class BeachCli < Formula
  desc "Command line tool for Flownative Beach"
  homepage "https://www.flownative.com/beach"
  url "https://storage.googleapis.com/cli-tool.beach.flownative.cloud/beach-0.2.8.phar"
  sha256 "b993fae43a6c046f864bed7e05d4d35d33e53388383989dcc36ea35354788db0"

  bottle :unneeded

  def install
    bin.install "beach-0.2.8.phar" => "beach"
  end
end
