class Wso2am260 < Formula
  desc "WSO2 API Manager 2.6.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2am-2.6.0.zip"
  sha256 "134a73cebfb78ebec15ecd089b723243804ac374b2828920b9d078b213fc796f"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2am"
    version = "2.6.0"

    puts "Installing WSO2 API Manager #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 API Manager #{version}."
    puts "\ncheers!!"
  end
end
