# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2ei660 < Formula
  desc "WSO2 Enterprise Integrator 6.6.0"
  homepage "https://wso2.com/integration/"
  url "https://dl.bintray.com/wso2/binary/wso2ei-6.6.0.zip"
  sha256 "85c7c8aedbcb7b2eb682b5283a0e47a995e54332fc91295fe3a12cf39fdd96d4"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2ei"
    version = "6.6.0"
    profiles = %w[integrator business-process broker analytics-dashboard analytics-worker]

    puts "Installing WSO2 Enterprise Integrator #{version}..."
    profiles.each do |profile|
      bin.install "bin/#{product}-#{version}-#{profile}" => "#{product}-#{version}-#{profile}"
    end
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun the following commands to start each profile of the WSO2 Enterprise Integrator #{version}.\n"
    profiles.each do |profile|
      puts "\t#{profile}".ljust(21) + ": #{product}-#{version}-#{profile}"
    end
    puts "\ncheers!!"
  end
end
