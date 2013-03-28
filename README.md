
PartialPerf
===========

In which I was looking at my logs, and saw an action report that it spent more than a second building the view, but hardly any time accessing the database.

This particular view (the Festival#show view on http://festivalfanatic.com) renders a partial for each screening in a film festival. I'd heard recently that partial rendering was extremely expensive (because of the overhead of marshalling arguments and 'locals' around, maybe?), but thought I'd see for myself.

Strategy
========

Render 10000 li tags on a page, five different ways:

- In one html.rb file (single_view)
- In a loop that renders a single partial (render_loop)
- With a single render that uses a collection to render the partial 10000 times (render_collection)
- With a helper that returns raw HTML marked html_safe (raw_html_helper)
- With a helper that calls content_tag to build its HTML (content_tag_helper)

Results
=======

A rule of thumb would be that each call to render is relatively expensive: render_loop was slowest by a factor of ten. All the rest are within 5% of the same performance: even the single call to render with :collection doesn't add much overhead.

My problem is that the structure of the page that started this renders a table for each day of a festival; within that table, there's a column with a single TD for each venue -- the TD contains all the screenings in that venue on that day, and is rendered with render :collection. This means that the page calls render a lot. 

Fortunately, the festival's HTML rarely changes, making the page an excellent caching opportunity.
