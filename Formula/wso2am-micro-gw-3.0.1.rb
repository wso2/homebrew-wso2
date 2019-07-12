class Wso2amMicroGw301 < Formula
  desc "WSO2 API Micro Gateway 3.0.1"
  homepage "https://wso2.com/api-management/api-microgateway/"
  url "https://dl.bintray.com/wso2/binary/wso2am-micro-gw-3.0.1.zip"
  sha256 "97933491fbd12119bde2b6362d3202e715046e5aaaf9787290b45a25536b6a4a"

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
    puts "\nRun #{product}-#{version} to start WSO2 Micor Integrator #{version}."
    puts "\ncheers!!"
  end
end
