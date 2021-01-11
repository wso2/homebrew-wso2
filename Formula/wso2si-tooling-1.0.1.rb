
class Wso2siTooling101 < Formula
    desc "WSO2 Streaming Integrator Tooling 1.0.1"
    homepage "https://wso2.com/integration/"
    url "https://dl.bintray.com/wso2/binary/wso2si-tooling-1.0.0.zip"
    sha256 "50ccd5db6589a5f6b5bde2d7f12b5dbab8070b4c0f774259f692fe4e797b6cc2"

    bottle :unneeded

    # depends_on "openjdk@11"

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
      product = "wso2si-tooling"
      version = "1.0.1"

      check_eula_acceptance()

      puts "Installing WSO2 Streaming Integrator Tooling #{version}..."
      bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
      libexec.install Dir["*"]
      bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))

      puts "Installation is completed."
      puts "\nRun #{product}-#{version} to start WSO2 Micor Integrator #{version}."
      puts "\ncheers!!"
    end
  end
