class Wso2siTooling101 < Formula
    desc "WSO2 Streaming Integrator Tooling 1.0.1"
    homepage "https://wso2.com/integration/"
    url "https://dl.bintray.com/wso2/binary/wso2si-tooling-1.0.0.zip"
    sha256 "50ccd5db6589a5f6b5bde2d7f12b5dbab8070b4c0f774259f692fe4e797b6cc2"

    bottle :unneeded

    # depends_on :java => "11"

    def install
      product = "wso2si-tooling"
      version = "1.0.1"

      puts "Installing WSO2 Streaming Integrator Tooling #{version}..."
      bin.install "bin/#{product}-#{version}" => "#{product}-#{version}"
      libexec.install Dir["*"]
      bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("11"))

      puts "Installation is completed."
      puts "\nRun #{product}-#{version} to start WSO2 Micor Integrator #{version}."
      puts "\ncheers!!"
    end
  end
