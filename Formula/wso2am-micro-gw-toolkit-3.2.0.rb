# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2amMicroGwToolkit320 < Formula
  desc "WSO2 API Micro Gateway Toolkit 3.2.0"
  homepage "https://wso2.com/api-management/api-microgateway/"
  url "https://dl.bintray.com/wso2/binary/wso2am-micro-gw-toolkit-3.2.0.zip"
  sha256 "0885a43f27466a4ac4d1422c4c0cbda9040b38675d572f218ab59e0476998122"

  bottle :unneeded

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
    product = "wso2am-micro-gw-toolkit"
    version = "3.2.0"

    check_eula_acceptance()

    puts "Installing WSO2 API Micro Gateway Toolkit #{version}..."
    bin.install "bin/micro-gw" => "micro-gw"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nIMPORTANT: After WSO2 Micro Gateway Toolkit #{version} is successfully installed, Instigate any improvements on top of a released WSO2 product by running In-Place Updates tool."
    puts "\nRun the command"
    puts "\n  micro-gw"
    puts "\nto start WSO2 Micro Gateway Toolkit #{version}."
    puts "\ncheers!!"
  end
end
