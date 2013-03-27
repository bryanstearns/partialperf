
desc "Collect samples of each view"
task :collect do
  actions = %w[
    single_view
    render_loop
    render_collection
    render_content_tag_helper
    render_raw_html_helper
  ]
  `/bin/rm -f log/*.samples`
  actions.each do |action|
    10.times { `wget localhost:3000/home/#{action} -O /dev/null` }
  end
end
