class Wso2ei700 < Formula
    desc "WSO2 Enterprise Integrator 7.0.2"
    homepage "https://wso2.com/integration/"
    url "https://dl.bintray.com/wso2/binary/wso2ei-7.0.2.zip"
    sha256 "1b3214d972ac2440fc61181f46ce5ea85e8259c9f7eb1d42ae34ecd03e991a11"

    bottle :unneeded

    depends_on :java => "1.8"

    def check_eula_acceptance()
        puts "in eula\n\n"
        notread = true
        print "IMPORTANT – READ CAREFULLY:"
        print "PLEASE REFER THE SOFTWARE LICENSE [https://wso2.com/license/wso2-update/LICENSE.txt] CAREFULLY BEFORE COMPLETING THE INSTALLATION PROCESS AND USING THE SOFTWARE."
        print "Do you agree with the WSO2 SOFTWARE LICENSE AGREEMENT?"
        while notread
          print "Please read WSO2 SOFTWARE LICENSE in  ? [Y/n]: "
          ans = gets.chomp
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
      version = "7.0.2"

      check_eula_acceptance()

      puts "Installing WSO2 Enterprise Integrator #{version}..."

      bin.install "micro-integrator/bin/wso2mi" => "wso2mi"
      bin.install "streaming-integrator/bin/wso2si" => "wso2si"

      libexec.install Dir["*"]
      bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

      puts "Installation is completed."
      puts "\nIMPORTANT: After WSO2 Enterprise Integrator 7.0.2 is successfully installed, Instigate any improvements on top of a released WSO2 product version by running In-Place Updates tool."
      puts "\nRun the following commands to start each components of the WSO2 Enterprise Integrator #{version}.\n"
      puts "\tMicro-Integrator".ljust(21) + ": wso2mi"
      puts "\tStreaming-Integrator".ljust(21) + ": wso2si"
      puts "\nCheers!!"
    end
  end
