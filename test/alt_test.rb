require "test_helper"

class AltTest < Minitest::Test
  def test_ruby_rule_lib_to_test
    assert_both_way "lib/directory/foo/bar.rb", "spec/directory/foo/bar_spec.rb"
  end

  def test_ruby_rule_lib_to_spec
    assert_both_way "lib/directory/foo/bar.rb", "test/directory/foo/bar_test.rb"
  end

  def test_ruby_rule_gemfile
    assert_both_way "Gemfile", "Gemfile.lock"
  end

  def test_yaml_rule_sample
    assert_both_way "config/database.yml", "config/database.example.yml"
  end

  def test_sample_rule
    assert_both_way "config/anything.ext", "config/anything.ext.example"
    assert_both_way "any/where/config.ext", "any/where/config.ext.sample"
  end

  def test_rails_rule_app_to_test
    assert_both_way "app/path/to/file.rb", "test/path/to/file_test.rb"
  end

  def test_rails_rule_app_to_test
    assert_both_way "app/path/to/file.rb", "spec/path/to/file_spec.rb"
  end

  def test_rails_rule_lib_to_test
    assert_both_way "lib/path/to/file.rb", "test/lib/path/to/file_test.rb"
  end

  def test_rails_rule_lib_to_test
    assert_both_way "lib/path/to/file.rb", "spec/lib/path/to/file_spec.rb"
  end

  def test_rails_rule_controller_to_functional_test
    assert_both_way "app/controllers/foo_controller.rb", "test/functional/foo_controller_test.rb"
  end

  def test_rails_rule_mailer_to_functional_test
    assert_both_way "app/mailers/foo_mailer.rb", "test/functional/foo_mailer_test.rb"
  end

  def test_rails_rule_helper_to_unit_test
    assert_both_way "app/helpers/my_helper.rb", "test/unit/helpers/my_helper_test.rb"
  end

  private

  def assert_both_way(from_path, to_path)
    assert_includes results_for(from_path), to_path
    assert_includes results_for(to_path), from_path
  end

  def results_for(path_str)
    path = Alt::Path.new(path_str)
    Alt::Finder.new(path).results
  end
end
