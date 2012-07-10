require "inboxer/version"

require 'yaml'
require 'pony'
require 'premailer'
require 'phantomjs.rb'

module Inboxer

  class Reporter

    def initialize(filename)
      @yml = YAML::load(File.open(filename))
    end

    def send!
      @yml.each do |report|
        premailer = Premailer.new(report['URL'], :warn_level => Premailer::Warnings::SAFE)
        report['Recipients'].each do |email|
          Pony.mail(:to => email, :from => report['From'],
                    :subject => report['Subject'], :html_body => premailer.to_inline_css,
                    :headers => {'X-Software' => 'Inboxer'}
                   )
        end
      end
    end

    def send_pdf!
      @yml.each do |report|
        report['Recipients'].each do |email|
          script = File.expand_path('../rasterize.js', __FILE__)
          file = "/tmp/output.#{rand(36**8).to_s(36)}.pdf"
          output = Phantomjs.run(script, report['URL'], file)
          Pony.mail(:to => email, :from => report['From'],
                    :subject => report['Subject'], :body => report['Content'],
                    :attachments => {'report.pdf' => File.read(file)},
                    :headers => {'X-Software' => 'Inboxer'}
                   )
        end
      end
    end

  end

end
