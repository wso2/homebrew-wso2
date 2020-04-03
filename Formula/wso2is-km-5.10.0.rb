# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2isKm5100 < Formula
  desc "WSO2 Identity Server as a Key Manager 5.10.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-km-5.10.0.zip"
  sha256 "39fd567f2592073e78d3b515735f6e722e930b396bc0c712543a10dcc28fac6c"

  bottle :unneeded

  # depends_on :java => "11"

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
    product = "wso2is-km"
    version = "5.10.0"

    puts "Installing WSO2 Identity Server as a Key Manager #{version}..."
    check_eula_acceptance()

    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Identity Server as a Key Manager #{version}."
    puts "\ncheers!!"
  end
end
