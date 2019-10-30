class Wso2isKm590 < Formula
  desc "WSO2 Identity Server as a Key Manager 5.9.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-km-5.9.0.zip"
  sha256 "ef7be94d551f43cdb8e2c531f17897a6106f8096faacdf65c69b18e033276b03"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2is-km"
    version = "5.9.0"

    puts "Installing WSO2 Identity Server as a Key Manager #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Identity Server as a Key Manager #{version}."
    puts "\ncheers!!"
  end
end
