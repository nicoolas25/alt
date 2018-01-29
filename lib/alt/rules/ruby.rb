module Alt::Rules::Ruby
  def rule_lib_to_test
    if @path.dirname =~ %r{\A(\./)?lib/(.+)}
      [
        ["spec", $2, @path.basename + "_spec" + @path.ext],
        ["test", $2, @path.basename + "_test" + @path.ext],
      ]
    end
  end

  def rule_test_to_lib
    if @path.basename =~ %r{_(spec|test)\z} &&
        @path.dirname =~ %r{\A(\./)?(spec|test)/(.+)}
      [
        ["lib", $3, @path.basename[0...-5] + @path.ext],
      ]
    end
  end
end
