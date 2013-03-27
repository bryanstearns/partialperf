
desc "Collect samples of each view"
task collect: :environment do
  `/bin/rm -f log/*.samples`
  HomeController::MEASUREMENT_ACTIONS.each do |action|
    10.times do
      `wget 127.0.0.1:3000/home/#{action} -O /dev/null`
      abort unless $?.success?
    end
  end
end
