class Wso2amMicroGw301 < Formula
  desc "WSO2 API Micro Gateway 3.0.1"
  homepage "https://wso2.com/api-management/api-microgateway/"
  url "https://dl.bintray.com/wso2/binary/wso2am-micro-gw-3.0.1.zip"
  sha256 "7cf68d87e2d9bc2e3d5db403bbd0e26402982ce16e987e0ef765fca879449c23"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2am-micro-gw"
    version = "3.0.1"

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
