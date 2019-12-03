class Wso2amMicroGwToolkit303 < Formula
  desc "WSO2 API Micro Gateway Toolkit 3.0.3"
  homepage "https://wso2.com/api-management/api-microgateway/"
  url "https://dl.bintray.com/wso2/binary/wso2am-micro-gw-toolkit-3.0.3.zip"
  sha256 "80203a8a84123e6529ece40b759295928437775d68738155244fde85ecf1c46c"

  bottle :unneeded

  def install
    product = "wso2am-micro-gw-toolkit"
    version = "3.0.3"

    puts "Installing WSO2 API Micro Gateway Toolkit #{version}..."
    bin.install "bin/micro-gw" => "micro-gw"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun"
    puts "\n  micro-gw"
    puts "\nto start WSO2 Micro Gateway Toolkit #{version}."
    puts "\ncheers!!"
  end
end
