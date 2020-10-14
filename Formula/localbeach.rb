# frozen_string_literal: true

#
# DO NOT EDIT THIS FILE MANUALLY
#
class Localbeach < Formula
  desc "Command-line tool for Flownative Beach"
  homepage "https://www.flownative.com/beach"
  license "GPL-3.0-or-later"
  version "v1.1.0+2"

  if RUBY_PLATFORM.downcase.include?("darwin")
    url "https://github.com/flownative/localbeach/releases/download/v1.1.0+2/beach_darwin_amd64.zip"
    sha256 "f9f07ecce93a90fd99bc3d745d2f7a51c064383c9c0daaa14475aac0d209d489"
  else
    url "https://github.com/flownative/localbeach/releases/download/v1.1.0+2/beach_linux_amd64.zip"
    sha256 "ec5ff3546e623d85caa323df65a8fee41148691ade75401b573bda1b81abcfd6"
  end

  bottle :unneeded

  conflicts_with "flownative/flownative/beach-cli", because: "localbeach replaces beach-cli"

  def install
    database_path = RUBY_PLATFORM.downcase.include?("darwin") ? "~/Library/Application Support/Flownative/Local Beach/MariaDB" : "~/.Flownative/Local Beach/MariaDB"

    bin.install "beach" => "beach"
    system "#{bin}/beach", "setup", "--docker-folder", "#{lib}/localbeach", "--database-folder", database_path
  end
end
