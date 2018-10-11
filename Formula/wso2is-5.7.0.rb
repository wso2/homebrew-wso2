class Wso2is570 < Formula
  desc "WSO2 Identity Server 5.7.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-5.7.0.zip"
  sha256 "84ba5b750441b162df4773fd7f4b99859e8a38dfb5f4702359a0900508c4dcc2"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2is"
    version = "5.7.0"

    puts "Installing WSO2 Identity Server #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Identity Server #{version}."
    puts "\ncheers!!"
  end
end
