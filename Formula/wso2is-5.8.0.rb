class Wso2is580 < Formula
  desc "WSO2 Identity Server 5.8.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-5.8.0.zip"
  sha256 "3b6ac82f37f7b3ed8d92157cc516ea3212e369213e50a3a32150783952d7d099"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    product = "wso2is"
    version = "5.8.0"

    puts "Installing WSO2 Identity Server #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Identity Server #{version}."
    puts "\ncheers!!"
  end
end
