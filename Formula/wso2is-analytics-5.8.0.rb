class Wso2isAnalytics580 < Formula
  desc "WSO2 Identity Server Analytics 5.8.0"
  homepage "https://wso2.com/identity-and-access-management/"
  url "https://dl.bintray.com/wso2/binary/wso2is-analytics-5.8.0.zip"
  sha256 "3701a2d5e7d96df1e2b6d389cf25ddb2a5359ed4f8319a46ec6050be42b0b906"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    product = "wso2is-analytics"
    version = "5.8.0"
    profiles = %w[dashboard worker manager]

    puts "Installing WSO2 Indentity Server Analytics #{version}..."
    profiles.each do |profile|
      bin.install "bin/#{product}-#{version}-#{profile}" => "#{product}-#{version}-#{profile}"
    end
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun the following commands to start each profile of the WSO2 Indentity Server Analytics #{version}.\n"
    profiles.each do |profile|
      puts "\t#{profile}".ljust(10) + ": #{product}-#{version}-#{profile}"
    end
    puts "\ncheers!!"
  end
end
