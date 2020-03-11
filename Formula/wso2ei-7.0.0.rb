class Wso2ei700 < Formula
  desc "WSO2 Enterprise Integrator 7.0.0"
  homepage "https://wso2.com/integration/"
  url "https://dl.bintray.com/wso2/binary/wso2ei-7.0.0.zip"
  sha256 "1b3214d972ac2440fc61181f46ce5ea85e8259c9f7eb1d42ae34ecd03e991a11"

  bottle :unneeded

  depends_on :java => "1.8"

  def check_eula_acceptance()
    notread = true
    puts "IMPORTANT – READ CAREFULLY:"
    puts "PLEASE REFER THE SOFTWARE LICENSE [https://wso2.com/license/wso2-update/LICENSE.txt] CAREFULLY BEFORE COMPLETING THE INSTALLATION PROCESS AND USING THE SOFTWARE."
    while notread
      print "Do you agree with the WSO2 SOFTWARE LICENSE AGREEMENT? "
      ans = STDIN.gets.chomp
      if ( ans == 'y' || ans == 'Y' )
          notread = false
          puts "\nCotinuing with the installment"
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
    product = "wso2ei"
    version = "7.0.0"

    check_eula_acceptance()

    chmod 0755, "ballerina-integrator/bin/ballerina"

    puts "Installing WSO2 Enterprise Integrator #{version}..."

    bin.install "micro-integrator/bin/wso2mi" => "wso2mi"
    bin.install "streaming-integrator/bin/wso2si" => "wso2si"
    bin.install "ballerina-integrator/bin/ballerina" => "ballerina"

    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun the following commands to start each components of the WSO2 Enterprise Integrator #{version}.\n"
    puts "\tBallerina".ljust(21) + ": ballerina"
    puts "\tMicro-Integrator".ljust(21) + ": wso2mi"
    puts "\tStreaming-Integrator".ljust(21) + ": wso2si"
    puts "\ncheers!!"
  end
end
