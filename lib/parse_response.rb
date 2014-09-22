class HTTPResponseParser

  def initialize(file)
    @file = file
  end

  def response_code
    @file.split[1].to_i
  end

  def version
    @file.split[0]
  end

  def body
    @file.split("\n\n")[1].delete("\n")
  end

  def header
    header = @file.split("\n\n")[0].split(/\n/)[1..-1].map { |line| [line.split(": ")[0] + ":", line.split(": ")[1]] }
    Hash[header]
  end

  def content_type
    header["Content-Type:"]
  end

  def server
    header["Server:"]
  end

  def location
    header["Location:"]
  end

end