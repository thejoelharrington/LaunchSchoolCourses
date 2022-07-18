class SecretFile
  attr_reader :data

  def initialize(secret_data, log)
    @data = secret_data
    @log = log
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end