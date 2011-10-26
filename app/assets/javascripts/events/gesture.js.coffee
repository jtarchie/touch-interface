class @GestureEventsDelegator
  constructor: (@owner) ->
    @gestures = []
    
    @document = $("body")
    @document.bind "gesturestart", (event) => @operateGesture event, @handleStart
    @document.bind "gesturechange", (event) => @operateGesture event, @handleChange
    @document.bind "gestureend", (event) => @operateGesture event, @handleEnd
    
  operateGesture: (event, func) ->
    originalEvent = event.originalEvent
    originalEvent.preventDefault()
    func.call(this, originalEvent)

  withinBbox: (gesture) ->
    bbox = @owner.getBBox()
    bbox.x <= gesture.pageX < bbox.x + bbox.width and
    bbox.y <= gesture.pageY < bbox.y + bbox.height
    
  handleStart: (gesture) ->
    if @withinBbox(gesture)
      @start.call(this, gesture)
      @gestures.push gesture
  
  handleChange: (gesture) ->
    if @withinBbox(gesture)
      unless gesture in @gestures
        @gestures.push gesture
      if gesture.rotation?
        @rotation(gesture)
      if gesture.scale?
        @scale(gesture)
  
  handleEnd: (gesture) ->
    if gesture in @gestures
      @end.call(this, gesture)
      @gestures.splice @touches.indexOf(gesture), 1
      
  #placeholders
  start: ->
  rotation: ->
  scale: ->
  end: ->