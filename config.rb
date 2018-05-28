require 'json'
require 'singleton'

class Config
  include Singleton
  attr_accessor :config

  def initialize
    file = File.read('conf.json')
    @config = JSON.parse(file)
  end


  def mail_from
    @config['mail_config']['from']
  end

  def mail_to
    @config['mail_config']['to']
  end

  def mail_cc
    @config['mail_config']['cc']
  end

  def exclude_projects
    @config['exclude_projects']
  end

end
