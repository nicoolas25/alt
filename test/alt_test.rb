require "test_helper"

class AltTest < Minitest::Test
  def test_ruby_rule_lib_to_test
    assert_both_way "lib/directory/foo/bar.rb", "spec/directory/foo/bar_spec.rb"
    assert_both_way "lib/directory/foo/bar.rb", "test/directory/foo/bar_test.rb"
  end

  def assert_both_way(from_path, to_path)
    assert_includes results_for(from_path), to_path
    assert_includes results_for(to_path), from_path
  end

  def results_for(path_str)
    path = Alt::Path.new(path_str)
    Alt::Finder.new(path).results
  end
end
