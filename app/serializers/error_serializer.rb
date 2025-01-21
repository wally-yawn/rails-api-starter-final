class ErrorSerializer
  def self.format_error(exception, status)
    # require 'pry'; binding.pry
    {
      message: "your request could not be completed",
      errors: [
        {
          status: status,
          title: exception.message
        }
      ]
    }
  end
end