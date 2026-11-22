class Readrelay < Formula
  desc "Sync read status for forwarded Gmail messages"
  homepage "https://github.com/ankitgoyalio/readrelay"
  url "https://github.com/ankitgoyalio/readrelay/releases/download/v0.1.0/readrelay-0.1.0-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "139a172651c20706a8548d7491ce0b216cff5f90e1e1819eccb13bb22a250a30"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "readrelay"
    prefix.install "LICENSE", "LICENSE.swift-argument-parser"
  end

  service do
    name macos: "homebrew.mxcl.readrelay"
    run [opt_bin/"readrelay", "service-run"]
    run_at_load true
    run_type :interval
    interval 900
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/readrelay --version").strip
  end
end
