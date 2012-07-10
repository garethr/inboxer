Command line utility to send emails of web pages to specified email addresses.

Lets say you have some dashboards showing up-to-date information about,
well, anything. But sometimes going to view the dashboards is too much
effort and what you want it a regular email report. Or maybe your boss
wants a nice weekly or month summary.

# Usage

    > inboxer
    Send emails of HTML pages to mailing list based on configuration file

    usage: inboxer [global options] command [command options]

    Version: 0.0.1

    Global Options:
        --help - Show this message

    Commands:
        help - Shows list of commands or help for one command
        send - Send all emails described in configuration file
        view - Display what is going to happen

So, given a yaml configuration file like so:

    -
      URL: http://example.com/1/
      Subject: Example report 1
      Recipients:
        - test1@example.com
        - test2@example.com
    -
      URL: http://example.com/2/
      Subject: Example report 2
      Recipients:
        - test1@example.com

We can run inboxer against it:

    inboxer send example.yml

You would tend to have separate yaml files for different frequencies
(say daily, weekly, monthly) and then setup a cron to trigger those at
the relevant times.

The default is to send an html and inline css version of the page via
email. As an alternative you can also send a pdf.

    inboxer pdf example.yml

# Installation

inboxer is written in ruby and available as a gem. I'd recommend
using bundler but you can also just install with:

    gem install inboxer

# License

Copyright (c) 2012 Gareth Rushgrove

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
