require "octocam/version"
require 'octocam/client'

module Octocam
  def self.generate
    Octocam::Client.new.generate
  end
end
