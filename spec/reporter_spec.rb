require_relative 'spec_helper'

require 'inboxer'

def run_report(fixture='spec/fixtures/single.yml')
  report = Inboxer::Reporter.new(fixture)
  report.send!
end

def run_pdf_report
  report = Inboxer::Reporter.new('spec/fixtures/single.yml')
  report.send_pdf!
end

def run_report_with_multiple_entries
  run_report 'spec/fixtures/multiple.yml'
end

describe 'Running a report with sample data' do
  before do
    @content = "sample content"
    @mailbox = "test@example.com"
    stub_request(:get, "http://example.com/").to_return(:body => @content)
    run_report
  end

  it 'should send an email' do
    unread_emails_for(@mailbox).size.should == 1
  end

  it 'the email should contain content from the response' do
    open_last_email_for(@mailbox)
    current_email.should have_body_text @content
  end

  it 'should have the set subject' do
    open_last_email_for(@mailbox)
    current_email.should have_subject "Example report"
  end

  it 'should be from the specified address' do
    open_last_email_for(@mailbox)
    current_email.should be_delivered_from "from@example.com"
  end

  it 'should set an identifying header' do
    open_last_email_for(@mailbox)
    current_email.should have_header("X-Software", "Inboxer")
  end
end

describe 'Running a report with multiple entries' do
  before do
    stub_request(:get, "http://example.com/1/").to_return(:body => "test1")
    stub_request(:get, "http://example.com/2/").to_return(:body => "test2")
    run_report_with_multiple_entries
  end

  it 'should send several emails' do
    unread_emails_for("test1@example.com").size.should == 2
    unread_emails_for("test2@example.com").size.should == 1
  end

  it 'should send emails which contain content from the response' do
    open_last_email_for "test1@example.com"
    current_email.should have_subject "Example report 2"
    current_email.should have_body_text "test2"
    open_last_email_for "test2@example.com"
    current_email.should have_subject "Example report 1"
    current_email.should have_body_text "test1"
  end

end
