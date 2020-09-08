# -------------------------------------------------------------------------
# Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
# -------------------------------------------------------------------------

class Wso2ei710 < Formula
  desc "WSO2 Enterprise Integrator 7.1.0"
  homepage "https://wso2.com/integration/"
  url "https://dl.bintray.com/wso2/binary/wso2ei-7.1.0.zip"
  sha256 "1ce283dd5dbd9ae5fe909cb1ad4249045dd2b74cf1a63a3e732f9cffb7325785"

  bottle :unneeded

  # depends_on :java => "1.8"

  def check_eula_acceptance()
      puts "in eula\n\n"
      notread = true
      print "IMPORTANT – READ CAREFULLY:"
      print "PLEASE REFER THE SOFTWARE LICENSE [https://wso2.com/license/wso2-update/LICENSE.txt] CAREFULLY BEFORE COMPLETING THE INSTALLATION PROCESS AND USING THE SOFTWARE."
      while notread
        print "Do you agree with the WSO2 SOFTWARE LICENSE AGREEMENT? [Y/n]: "
        ans = STDIN.gets.chomp
        puts "#{ans}"
        if ( ans == 'y' || ans == 'Y' )
            notread = false
            puts "Continuing with the installment"
        elsif ( ans == 'n' || ans == 'N'  )
            notread = false
            puts "Installation Aborted !"
            exit(0)
        else
            puts "Please enter Y if you agrees with EULA. Otherwise enter N"
            notread = true
        end
      end
  end

  def install
    product = "wso2ei"
    version = "7.1.0"

    check_eula_acceptance()

    puts "Installing WSO2 Enterprise Integrator #{version}..."

    bin.install "micro-integrator/bin/wso2mi-runtime" => "wso2mi-runtime-1.2.0"
    bin.install "micro-integrator-dashboard/bin/wso2mi-dashboard" => "wso2mi-dashboard-1.2.0"
    bin.install "streaming-integrator/bin/wso2si" => "wso2si-1.1.0"

    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))

    puts "Installation is completed."
    puts "\nIMPORTANT: After WSO2 Enterprise Integrator #{version} is successfully installed."
    puts "\nRun the following commands to update each components of the WSO2 Enterprise Integrator #{version}.\n"
    puts "\nRun the following commands to start each components of the WSO2 Enterprise Integrator #{version}.\n"
    puts "\tMicro-Integrator Runtime".ljust(21) + ": wso2mi-runtime-1.2.0"
    puts "\tMicro-Integrator Dashboard".ljust(21) + ": wso2mi-dashboard-1.2.0"
    puts "\tStreaming-Integrator".ljust(21) + ": wso2si-1.1.0"
    puts "\nCheers!!"
  end
end
