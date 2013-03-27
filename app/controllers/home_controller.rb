class HomeController < ApplicationController
  MEASUREMENT_ACTIONS = Dir.glob("app/views/home/*.html.erb")\
                           .map {|f| File.basename(f).split('.').first }\
                           - %w[_i index]
end
