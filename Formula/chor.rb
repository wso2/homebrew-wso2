class Chor < Formula

  chor_version = "0.0.4"

  desc "CLI to manage integration applications with Choreo platform"
  homepage "https://github.com/wso2/choreo-cli"
  url "https://github.com/wso2/choreo-cli/archive/v#{chor_version}.tar.gz"
  sha256 "e3d8140747083b69fec163428434c7d5e68cb5c0a35d8f7c143ad10f82583490"

  bottle do
    root_url "https://github.com/wso2/choreo-cli/releases/download/v#{chor_version}"
    sha256 "ae5fe190764b36d5e438a890de3c38bba2afe64b2e84ff48be2735fd286ae51f" => :high_sierra
    sha256 "ae5fe190764b36d5e438a890de3c38bba2afe64b2e84ff48be2735fd286ae51f" => :mojave
  end

  depends_on "go" => :build

  def install
    system "make", "build-cli"
    bin.install "builder/target/chor"
  end

  test do
    output=shell_output("chor version").split
    assert_match "#{chor_version}", output[1]
  end

end
