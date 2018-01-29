class Alt::Path
  attr_reader :dirname, :basename, :ext

  def initialize(path_str)
    @path_str = path_str
    @ext = File.extname(path_str)
    @basename = File.basename(path_str, ext)
    @dirname = File.dirname(path_str)
  end

  def to_s
    @path_str
  end
end
