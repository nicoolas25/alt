require "hanami/cli"

module Alt::CLI::Commands
  extend Hanami::CLI::Registry

  autoload :Version, "alt/cli/commands/version"
  autoload :Guess,   "alt/cli/commands/guess"

  register "version", Version, aliases: ["v", "-v", "--version"]
  register "guess",   Guess,   aliases: ["g"]
  # register "start",   Start
  # register "stop",    Stop

  # register "generate", aliases: ["g"] do |prefix|
  #   prefix.register "config", Generate::Configuration
  #   prefix.register "test",   Generate::Test
  # end
end

=begin

class Start < Hanami::CLI::Command
  desc "Start Foo machinery"

  argument :root, required: true, desc: "Root directory"

  example [
    "path/to/root # Start Foo at root directory"
  ]

  def call(root:, **)
    puts "started - root: #{root}"
  end
end

class Stop < Hanami::CLI::Command
  desc "Stop Foo machinery"

  option :graceful, type: :boolean, default: true, desc: "Graceful stop"

  def call(**options)
    puts "stopped - graceful: #{options.fetch(:graceful)}"
  end
end

module Generate
  class Configuration < Hanami::CLI::Command
    desc "Generate configuration"

    def call(*)
      puts "generated configuration"
    end
  end

  class Test < Hanami::CLI::Command
    desc "Generate tests"

    option :framework, default: "minitest", values: %w[minitest rspec]

    def call(framework:, **)
      puts "generated tests - framework: #{framework}"
    end
  end
end
=end
