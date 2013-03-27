class HomeController < ApplicationController
  MEASUREMENT_ACTIONS = Dir.glob("app/views/home/*.html.erb")\
                           .map {|f| File.basename(f).split('.').first }\
                           - %w[_i index]

  def index
    @samples = read_samples
  end

protected
  def read_samples
    Dir.glob("log/#{Rails.env}.*.samples").inject({}) do |h, sample_file|
      action = File.basename(sample_file).split(".")[1]
      samples = File.readlines(sample_file).map(&:to_i)
      h[action] = samples
      h
    end
  end
end
