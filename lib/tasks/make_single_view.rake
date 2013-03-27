
single_view_path = "app/views/home/single_view.html.erb"
desc "create #{single_view_path}"
task :make_single_view do
  File.open(single_view_path, 'w') do |f|
    f.puts "<h1>Home#render_collection</h1>"
    f.puts "<ul>"
    (0...10000).each do |i|
      f.puts "<li><%= #{i} %></li>"
    end
    f.puts "</ul>"
  end
end
