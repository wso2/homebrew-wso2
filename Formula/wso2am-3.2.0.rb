# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2am320 < Formula
    desc "WSO2 API Manager 3.2.0"
    homepage "https://wso2.com/api-management/"
    url "https://dl.bintray.com/wso2/binary/wso2am-3.2.0.zip"
    sha256 "a6fa90c0296a2b96b9cee87ecfa939ebd9d3d873c6044617246c4ebae7a2372a"

    bottle :unneeded

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
      version = "3.2.0"

      check_eula_acceptance()

      puts "Installing WSO2 API Manager #{version}..."
      bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
      libexec.install Dir["*"]
      bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))

      puts "Installation is completed."
      puts "\nIMPORTANT: After WSO2 API Manager #{version} is successfully installed, Instigate any improvements on top of a released WSO2 product by running the Updates tool."
      puts "\nRun the following command to update the WSO2 API Manager #{version}.\n"
      puts "\t/usr/local/Cellar/#{product}-#{version}/#{version}/libexec/bin/update_darwin"
      puts "\nRun the command #{product}-#{version} to start WSO2 API Manager #{version}."
      puts "\nCheers!!"
    end
end
