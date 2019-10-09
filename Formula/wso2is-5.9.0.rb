class Wso2is590 < Formula
  desc "WSO2 Identity Server 5.9.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-5.9.0.zip"
  sha256 "4ff3a630ca7dda4022fe14f6e4e6e6a65dd77087b294ffdfa15f2ffe2cf303a1"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2is"
    version = "5.9.0"

    puts "Installing WSO2 Identity Server #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Identity Server #{version}."
    puts "\ncheers!!"
  end
end
