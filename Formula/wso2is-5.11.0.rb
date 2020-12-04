# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2is5110 < Formula
  desc "WSO2 Identity Server 5.11.0"
  homepage "https://wso2.com/identity-and-access-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-5.11.0.zip"
  sha256 "d9f5990dc0f80213e3120c278ef552a167d1c2fe89be207e9dffdea6bee5edc8"

  bottle :unneeded

#  depends_on :java => "11"

  def check_eula_acceptance()
    notread = true
    puts "\nIMPORTANT – READ CAREFULLY:"
    puts "PLEASE REFER THE SOFTWARE LICENSE [https://wso2.com/license/wso2-update/LICENSE.txt] CAREFULLY BEFORE COMPLETING THE INSTALLATION PROCESS AND USING THE SOFTWARE."
    while notread
      print "DO YOU AGREE WITH WSO2 SOFTWARE LICENSE AGREEMENT ? [Y/n]: "
      ans = STDIN.gets.chomp
      if ( ans == 'y' || ans == 'Y' )
          notread = false
          puts "\nContinuing with the installation"
      elsif ( ans == 'n' || ans == 'N'  )
          notread = false
          puts "\nInstallation Aborted !"
          exit(0)
      else
          puts "Please enter Y if you agrees with EULA. Otherwise enter N"
          notread = true
      end
    end
  end

  def install
    product = "wso2is"
    version = "5.11.0"

    check_eula_acceptance()

    puts "Installing WSO2 Identity Server #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))

    puts "Installation is completed."
    puts "\nIMPORTANT: After WSO2 Identity Server 5.11.0 is successfully installed, Instigate any improvements on top of a released WSO2 product version by running Updates tool."
    puts "\nRun #{product}-#{version} to start WSO2 Identity Server #{version}."
    puts "\nCheers!!"
  end
end
