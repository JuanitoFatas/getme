require 'getme/version'
require 'getme/exceptions'
require 'getme/utilities'
require 'getme/vendors'

module Getme

  extend self

  def the(what=nil)
    return "What do you want me to download for you?" if what.nil?
    what = what.to_sym
    type ||= if Getme::Vendors[:files].has_key? what
               :files
             elsif Getme::Vendors[:zips].has_key? what
               :zips
             else
               :not_available
             end
    return "Did not find a candidate of #{what}, typo?" if type == :not_available
    unless Getme::Vendors[type][what].nil?
      util = Utilities.new
      util.cmd(util.downloader, Getme::Vendors[type][what])
      return 'success!'
    end
  end
end
