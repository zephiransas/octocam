require 'octokit'
require 'optparse'
require 'time'

class Octocam::Client

  def generate
    args = Argument.new

    Octokit.auto_paginate = true
    client = Octokit::Client.new(access_token: ENV['OCTOCAM_GITHUB_TOKEN'])

    pull_requests = client.pull_requests("#{args.owner}/#{args.repository}", state: 'closed').reject{|pr| pr[:merged_at] == nil }
    pull_requests.select{|pr| pr[:merged_at].localtime >= args.from && pr[:merged_at].localtime <= args.to }.sort{|a, b| -(a[:merged_at] <=> b[:merged_at]) }.each do |pull_request|
      puts "- #{pull_request[:title]} [[##{pull_request[:number]}](#{pull_request[:html_url]})]"
    end
  end

  class Argument
    def initialize
      params = ARGV.getopts('o:r:f:t:')
      @owner = params['o']
      @repository = params['r']
      @from = params['f']
      @to = params['t']
    end

    def owner; @owner; end
    def repository; @repository; end

    def from
      Time.parse(@from)
    end

    def to
      Time.parse(@to)
    end
  end

end