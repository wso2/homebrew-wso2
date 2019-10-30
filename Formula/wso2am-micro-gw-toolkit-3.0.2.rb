class Wso2amMicroGwToolkit302 < Formula
  desc "WSO2 API Micro Gateway Toolkit 3.0.2"
  homepage "https://wso2.com/api-management/api-microgateway/"
  url "file:/Users/wso2/Documents/EI7/brew/wso2am-micro-gw-toolkit-3.0.2.zip"
  sha256 "0b65ccc0f447f40c301c6210d6d5c27022f2a903bf8399d24bd2a4f98a359e56"

  bottle :unneeded

  def install
    product = "wso2am-micro-gw-toolkit"
    version = "3.0.2"

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
