# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LlvmMingw < Formula
  desc "An LLVM/Clang/LLD based mingw-w64 toolchain"
  homepage "https://github.com/mstorsjo/llvm-mingw"
  url "https://github.com/mstorsjo/llvm-mingw/releases/download/20251216/llvm-mingw-20251216-ucrt-macos-universal.tar.xz"
  sha256 "38bb5e48ec3e0ce95fb901f4efff0bd6ffa966d1b32539a6510af816a959d160"
  license "NOASSERTION"
  
  keg_only :provided_by_macos

  def install
    prefix.install Dir["./*"]
  end

  test do
    resource "run-tests.sh" do
      url "https://github.com/mstorsjo/llvm-mingw/raw/refs/tags/20251216/run-tests.sh"
      sha256 "bab8cb09f00225fa77b679b21d35d05f17a4bdaf7f6aec9d18a0a752ed57914d"
    end

    resource("run-tests.sh").stage do
      system "/bin/bash", "run-tests.sh", prefix
    end
  end
end
