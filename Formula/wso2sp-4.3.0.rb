class Wso2sp430 < Formula
  desc "WSO2 Stream Processor 4.3.0"
  homepage "https://wso2.com/analytics-and-stream-processing/"
  url "https://dl.bintray.com/wso2/binary/wso2sp-4.3.0.zip"
  sha256 "81c9e82b05db49026fe96fcd0ede60d54622e92f919f7b50d926f35a7fa5ff1e"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    product = "wso2sp"
    version = "4.3.0"
    profiles = %w[dashboard editor worker manager]

    puts "Installing WSO2 Stream Processor #{version}..."
    profiles.each do |profile|
      bin.install "bin/#{product}-#{version}-#{profile}" => "#{product}-#{version}-#{profile}"
    end
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun the following commands to start each profile of the WSO2 Stream Processor #{version}.\n"
    profiles.each do |profile|
      puts "\t#{profile}".ljust(10) + ": #{product}-#{version}-#{profile}"
    end
    puts "\ncheers!!"
  end
end
