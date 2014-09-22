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
    header_hash = {}
    header_array = @file.split("\n\n")[0].split(/\n/)[1..-1]
    header_array.each do |line|
      split_line = line.split(': ')
      header_hash[split_line[0] + ':'] = split_line[1]
    end
    header_hash
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