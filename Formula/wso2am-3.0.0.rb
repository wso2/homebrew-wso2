# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2am300 < Formula
  desc "WSO2 API Manager 3.0.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2am-3.0.0.zip"
  sha256 "a0fb0fdea6ff1901206dcb875ced4711929f0c78e700e0d29ad6886dfd9a1fe9"

  bottle :unneeded

  depends_on "openjdk@8"

  def check_eula_acceptance()
    notread = true
    puts "\nIMPORTANT – READ CAREFULLY:"
    puts "PLEASE REFER THE SOFTWARE LICENSE [https://wso2.com/license/wso2-update/LICENSE.txt] CAREFULLY BEFORE COMPLETING THE INSTALLATION PROCESS AND USING THE SOFTWARE."
    while notread
      print "Do you agree with the WSO2 SOFTWARE LICENSE AGREEMENT ? [Y/n]: "
      ans = STDIN.gets.chomp
      if ( ans == 'y' || ans == 'Y' )
          notread = false
          puts "\nContinuing with the installment"
      elsif ( ans == 'n' || ans == 'N'  )
          notread = false
          puts "\nInstallation Aborted !"
          exit(0)
      else
          puts "\nPlease enter Y if you agrees with EULA. Otherwise enter N"
          notread = true
      end
    end
  end

  def install
    product = "wso2am"
    version = "3.0.0"

    check_eula_acceptance()

    puts "Installing WSO2 API Manager #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nIMPORTANT: After WSO2 API Manager 3.0.0 is successfully installed, Instigate any improvements on top of a released WSO2 product version by running In-Place Updates tool."
    puts "\nRun #{product}-#{version} to start WSO2 API Manager #{version}."
    puts "\nCheers!!"
  end
end
