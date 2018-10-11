class Wso2amAnalytics260 < Formula
  desc "WSO2 API Manager Analytics 2.6.0"
  homepage "https://wso2.com/api-management/"
  url "https://dl.bintray.com/wso2/binary/wso2am-analytics-2.6.0.zip"
  sha256 "43e75fb845f4749160f1d7090cb444cbf62c0a5a2d92da4ab33d7d88850e155e"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2am-analytics"
    version = "2.6.0"
    profiles = %w[dashboard worker manager]

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
