# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LlvmMingw < Formula
  desc "An LLVM/Clang/LLD based mingw-w64 toolchain"
  homepage "https://github.com/mstorsjo/llvm-mingw"
  url "https://github.com/mstorsjo/llvm-mingw/releases/download/20260311/llvm-mingw-20260311-ucrt-macos-universal.tar.xz"
  sha256 "42715d845b8f92941b1226d5d648c7de82dd79d67613209fea8397cf78d955a0"
  license "ISC"
  
  keg_only :provided_by_macos

  def install
    prefix.install Dir["./*"]
  end

  test do
    resource "run-tests.sh" do
      url "https://github.com/mstorsjo/llvm-mingw/raw/refs/tags/20251216/run-tests.sh"
      sha256 "77a71ea6f2d60f0f9be780863d52791bcf60c5c3e163b7d390bfc41e4b265d69"
    end

    resource("run-tests.sh").stage do
      system "/bin/bash", "run-tests.sh", prefix
    end
  end
end
