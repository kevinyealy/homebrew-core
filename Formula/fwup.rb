class Fwup < Formula
  desc "Configurable embedded Linux firmware update creator and runner"
  homepage "https://github.com/fhunleth/fwup"
  url "https://github.com/fhunleth/fwup/releases/download/v1.8.4/fwup-1.8.4.tar.gz"
  sha256 "3fb07866e236905de4f66559b06cf73e220fc099807ae19a6ac25a4e36ab67dd"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any, arm64_big_sur: "24af6cc94eb8d03ab198e93d451a56933751f550a822d5b4dba69d62fa989d12"
    sha256 cellar: :any, big_sur:       "5f66239fb94a6b04ffbf6e74d2f3a6ebd083625faa78b96ee8c671fd33919e94"
    sha256 cellar: :any, catalina:      "c7f3841b362480d6b900147a0155948fa079728e10709f695409e122fcbec4de"
    sha256 cellar: :any, mojave:        "a7a157b8950cd5929e1c525012835880f6f9cc7e1e626ac33a0f49938b6a957f"
  end

  depends_on "pkg-config" => :build
  depends_on "confuse"
  depends_on "libarchive"

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make", "install"
  end

  test do
    system bin/"fwup", "-g"
    assert_predicate testpath/"fwup-key.priv", :exist?, "Failed to create fwup-key.priv!"
    assert_predicate testpath/"fwup-key.pub", :exist?, "Failed to create fwup-key.pub!"
  end
end
