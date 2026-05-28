# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LlvmMingw < Formula
  desc "An LLVM/Clang/LLD based mingw-w64 toolchain"
  homepage "https://github.com/mstorsjo/llvm-mingw"
  url "https://github.com/mstorsjo/llvm-mingw/releases/download/20260519/llvm-mingw-20260519-ucrt-macos-universal.tar.xz"
  sha256 "09a4d4c014741d92409d62c0a76541dc0d61cbfa79fc7f9220211523a4e01f2b"
  license "ISC"
  
  keg_only :provided_by_macos

  def install
    prefix.install Dir["./*"]
  end

  test do
    resource "run-tests.sh" do
      url "https://github.com/mstorsjo/llvm-mingw/raw/refs/tags/20260519/run-tests.sh"
      sha256 "77a71ea6f2d60f0f9be780863d52791bcf60c5c3e163b7d390bfc41e4b265d69"
    end

    resource("run-tests.sh").stage do
      system "/bin/bash", "run-tests.sh", prefix
    end
  end
end
