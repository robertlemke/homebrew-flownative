# frozen_string_literal: true

#
# DO NOT EDIT THIS FILE MANUALLY
#
class Localbeach < Formula
  desc "Command-line tool for Flownative Beach"
  homepage "https://www.flownative.com/beach"
  license "GPL-3.0-or-later"
  version "v1.1.1+1"

  if RUBY_PLATFORM.downcase.include?("darwin")
    url "https://github.com/flownative/localbeach/releases/download/v1.1.1+1/beach_darwin_amd64.zip"
    sha256 "d448f14cf6430155b45ecb84fad6fc5d78e086da4f1aafcebb0ccdf2f1d26fd2"
  else
    url "https://github.com/flownative/localbeach/releases/download/v1.1.1+1/beach_linux_amd64.zip"
    sha256 "15a72857cc96015f9fe64f73e4f5225fd6ddbccd479ffe27f2273f741cfb488c"
  end

  bottle :unneeded

  conflicts_with "flownative/flownative/beach-cli", because: "localbeach replaces beach-cli"

  def install
    database_path = RUBY_PLATFORM.downcase.include?("darwin") ? "~/Library/Application Support/Flownative/Local Beach/MariaDB" : "~/.Flownative/Local Beach/MariaDB"

    bin.install "beach" => "beach"
    system "#{bin}/beach", "setup", "--docker-folder", "#{lib}/localbeach", "--database-folder", database_path
  end
end
