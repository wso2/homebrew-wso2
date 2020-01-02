class Wso2amMicroGwToolkit304 < Formula
  desc "WSO2 API Micro Gateway Toolkit 3.0.4"
  homepage "https://wso2.com/api-management/api-microgateway/"
  url "https://dl.bintray.com/wso2/binary/wso2am-micro-gw-toolkit-3.0.4.zip"
  sha256 "9d6a4f1e34fa37e5f0526c643179615d0fb7ca7649dace1ff6ccf89dc15818de"

  bottle :unneeded

  def install
    product = "wso2am-micro-gw-toolkit"
    version = "3.0.4"

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
