class Wso2amMicroGw302 < Formula
  desc "WSO2 API Micro Gateway 3.0.2"
  homepage "https://wso2.com/api-management/api-microgateway/"
  url "https://dl.bintray.com/wso2/binary/wso2am-micro-gw-3.0.2.zip"
  sha256 "24e384e124439a2ba0c77b9458b7f508941148edbafe85b6a7730dcc084a8ee7"

  bottle :unneeded

  def install
    product = "wso2am-micro-gw"
    version = "3.0.2"

    puts "Installing WSO2 API Micro Gateway #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun"
    puts "\n  #{product}-#{version} <Path_to_Executable_Artifact>"
    puts "\nto start WSO2 Micro Gateway #{version}."
    puts "\ncheers!!"
  end
end
