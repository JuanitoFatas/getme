module Getme
  class Utilities
    def cmd(badass, url)
      if badass == :wget
        `wget #{Shellwords.escape url}`
      elsif badass == :curl
        `curl -O #{Shellwords.escape url}`
      end
    end

    def downloader
      if cmd?('wget')
        :wget
      elsif cmd?('curl')
        :curl
      else
        raise Getme::WgetOrCurlNotAvailableError, 'Wget or Curl not available for download files, install one? :D'
      end
    end

    # check if cmd available from system
    def cmd?(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return true if File.executable? exe
        }
      end
      return false
    end

  end
end