class Alt::CLI::Commands::Version < Hanami::CLI::Command
  desc "Print version"

  def call(*)
    puts Alt::VERSION
  end
end
