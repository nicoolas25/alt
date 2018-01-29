class Alt::Filter
  def initialize(finder)
    @results = finder.results
  end

  def results
    @results.select { |path_str| File.exist?(path_str) }
  end
end
