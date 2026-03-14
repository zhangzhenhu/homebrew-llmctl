# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Llmctl < Formula
  desc "A CLI tool for testing and validating LLM services"
  homepage "https://github.com/zhangzhenhu/llmctl"
  license "MIT"
  version "0.1.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/zhangzhenhu/llmctl/releases/download/v#{version}/llmctl-v#{version}-aarch64-apple-darwin.tar.gz"
    else
      url "https://github.com/zhangzhenhu/llmctl/releases/download/v#{version}/llmctl-v#{version}-x86_64-apple-darwin.tar.gz"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zhangzhenhu/llmctl/releases/download/v#{version}/llmctl-v#{version}-aarch64-unknown-linux-musl.tar.gz"
    else
      url "https://github.com/zhangzhenhu/llmctl/releases/download/v#{version}/llmctl-v#{version}-x86_64-unknown-linux-musl.tar.gz"
    end
  end

  def install
    bin.install "llmctl"
  end

  test do
    assert_match "llmctl", shell_output("#{bin}/llmctl --help")
  end
end
