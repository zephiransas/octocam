require 'octokit'
require 'optparse'
require 'time'
require 'octocam/parser'

class Octocam::Client

  def generate
    options = Octocam::Parser.parse_options

    Octokit.auto_paginate = true
    client = Octokit::Client.new(access_token: ENV['OCTOCAM_GITHUB_TOKEN'])

    pull_requests = client.pull_requests("#{options[:owner]}/#{options[:repository]}", state: 'closed').reject{|pr| pr[:merged_at] == nil }
    pull_requests.select{|pr| pr[:merged_at].localtime >= options[:from] && pr[:merged_at].localtime <= options[:to] }.sort{|a, b| -(a[:merged_at] <=> b[:merged_at]) }.each do |pull_request|
      puts "- #{pull_request[:title]} [[##{pull_request[:number]}](#{pull_request[:html_url]})]"
    end
  end

end