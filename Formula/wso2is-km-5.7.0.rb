class Wso2isKm570 < Formula
  desc "WSO2 Identity Server as a Key Manager 5.7.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-km-5.7.0.zip"
  sha256 "89cfd12ded02d27b1fe44a0bbfe319af92939905d02182d331ce2d87eb968476"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2is-km"
    version = "5.7.0"

    puts "Installing WSO2 Identity Server as a Key Manager #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Identity Server as a Key Manager #{version}."
    puts "\ncheers!!"
  end
end
