class Wso2amAnalytics300 < Formula
  desc "WSO2 API Manager Analytics 3.0.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2am-analytics-3.0.0.zip"
  sha256 "4acc378d353928bac99c535e45bc6334578d075027b8f0bda4337bca350afd7d"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2am-analytics"
    version = "3.0.0"
    profiles = %w[dashboard worker]

    puts "Installing WSO2 API Manager Analytics #{version}..."
    profiles.each do |profile|
      bin.install "bin/#{product}-#{version}-#{profile}" => "#{product}-#{version}-#{profile}"
    end
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun the following commands to start each profile of the WSO2 API Manager Analytics #{version}.\n"
    profiles.each do |profile|
      puts "\t#{profile}".ljust(10) + ": #{product}-#{version}-#{profile}"
    end
    puts "\ncheers!!"
  end
end
