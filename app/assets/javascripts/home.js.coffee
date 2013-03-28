# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  graph = $('#graph')
  graph.highcharts(
    chart: {
      type: 'line'
    },
    title: {
      text: 'View processing time'
    },
#    xAxis: {
#      categories: ['Apples', 'Bananas', 'Oranges']
#    },
    yAxis: {
      title: {
        text: 'ms.'
      }
    },
    series: graph.data('samples')
  )
