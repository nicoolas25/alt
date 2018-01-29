module Alt::Rules
  autoload :Ruby, "alt/rules/ruby"

  def self.load(name, instance)
    (class << instance; self; end).include(const_get(name))
  end
end
