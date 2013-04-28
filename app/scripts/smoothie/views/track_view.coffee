# Track view
# Handles the rendering of a single track

define ['backbone',
        'underscore',
        'smoothie/models/track'], \

        (Backbone, _, Track) ->

  TrackView = Backbone.View.extend {

    template:
      '<div class="overlay"></div>' +
      '<a class="artist" href="<%= user_permalink %>"><%= username %></a>' +
      '<br/>' +
      '<a class="title" href="<%= permalink_url %>"><%= title %></a>'


    # Initialize with a track
    initialize: () ->
      @model = @options.model

    # Render the track
    render: () ->
      @$el.html( _.template @template, @model.attributes )

      # Set the background according to the artwork
      if @model.get('artwork_url')
        @$el.css 'background-image', "url(#{@model.get('artwork_url')})" 

      else
        @$el.css( 'background-image', 'url(/images/default-track-bg.png)')
            .css( 'background-color', '#F2F2F2')
            .css( 'background-size' , 'inherit')

      this

  }