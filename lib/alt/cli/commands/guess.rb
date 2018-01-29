class Alt::CLI::Commands::Guess < Hanami::CLI::Command
  desc "Guess the alternate files"

  argument :path, desc: "Path to give alternates", required: true

  example [
    "app/models/car.rb       # => spec/models/car_spec.rb",
    "spec/models/car_spec.rb # => app/models/car.rb",
  ]

  def call(path:, **)
    puts Alt::Filter.new(
      Alt::Finder.new(
        Alt::Path.new(path)
      )
    ).results
  end
end

