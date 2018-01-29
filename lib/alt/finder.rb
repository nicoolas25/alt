class Alt::Finder
  def initialize(path)
    @path = path
    @rules = Alt::Rules.load(lang, self)
  end

  def results
    methods.
      select { |name| name.to_s.start_with?("rule_") }.
      map { |name| method(name) }.
      flat_map { |m| m.call }.
      compact.
      map { |path_elements| path_elements.join("/") }
  end

  private

  def lang
    # Add new langage support here.
    mapping = { ".rb" => "Ruby" }

    mapping.fetch(@path.ext) do
      raise "Unsupported extension: '#{@path.ext}'"
    end
  end
end
