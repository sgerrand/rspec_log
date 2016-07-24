require_relative '../lib/rspec_log'

logs = nil

RSpec.configure do |config|
  config.color = true
  config.formatter = 'RainbowDocumentation'

  config.before :suite do
    logs = RSpecLog.new(newfile: true)
  end

  config.after :all do
    logs.write_file
  end

  config.after :suite do
    RSpecLog.print_logs_from_file
  end
end