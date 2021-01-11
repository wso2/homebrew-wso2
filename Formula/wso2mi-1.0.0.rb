class Wso2mi100 < Formula
  desc "WSO2 Micro Integrator 1.0.0"
  homepage "https://wso2.com/integration/"
  url "https://dl.bintray.com/wso2/binary/wso2mi-1.0.0.zip"
  sha256 "97933491fbd12119bde2b6362d3202e715046e5aaaf9787290b45a25536b6a4a"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    product = "wso2mi"
    version = "1.0.0"

    puts "Installing WSO2 Micro Integrator #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Micor Integrator #{version}."
    puts "\ncheers!!"
  end
end
