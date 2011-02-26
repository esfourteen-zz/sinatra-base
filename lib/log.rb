require 'active_support/buffered_logger'
require 'stringio'

class Log < ActiveSupport::BufferedLogger
  SEVERITIES = Hash[Severity.constants.map {|c| [Severity.const_get(c), c]}]

  def add(severity, message = nil, progname = nil, &block)
      return if @level > severity
      message = (message || (block && block.call) || progname).to_s
      message = "[#{Time.now.strftime('%Y-%m-%d %k:%M:%S')}] #{SEVERITIES[severity]} #{message.strip}\n"
      super(severity, message, progname, &block)
    end
end