class Wso2siTooling100 < Formula
  desc "WSO2 Streaming Integrator Tooling 1.0.0"
  homepage "https://wso2.com/integration/"
  url "https://dl.bintray.com/wso2/binary/wso2si-tooling-1.0.0.zip"
  sha256 "356ce603a245db1e51d62edb3c47c5d7d6649adc3baaa76d633bdd27049a27be"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    product = "wso2si-tooling"
    version = "1.0.0"

    puts "Installing WSO2 Streaming Integrator Tooling #{version}..."
    bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
    libexec.install Dir["*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    puts "Installation is completed."
    puts "\nRun #{product}-#{version} to start WSO2 Micor Integrator #{version}."
    puts "\ncheers!!"
  end
end
