class @TouchEventsDelegator
  constructor: (@owner) ->
    @touches = []
    
    @document = $("body")
    @document.bind "touchstart", (event) => @operateTouch event, @handleStart
    @document.bind "touchmove", (event) => @operateTouch event, @handleMove
    @document.bind "touchend", (event) => @operateTouch event, @handleEnd
    @document.bind "touchcancel", (event) => @operateTouch event, @handleEnd
	
  operateTouch: (event, func) ->
    originalEvent = event.originalEvent
    originalEvent.preventDefault()
    for touch in event.originalEvent.changedTouches
      func.call(this, touch)

  withinBbox: (touch) ->
    bbox = @owner.getBBox()
    bbox.x <= touch.pageX < bbox.x + bbox.width and
    bbox.y <= touch.pageY < bbox.y + bbox.height
  
  hasTouch: (touch) ->
    touch in @touches
  
  handleStart: (touch) ->
    if @withinBbox(touch)
      @start.call(this, touch)
      @touches.push touch

  handleMove: (touch) ->
    if @withinBbox(touch)
      if @hasTouch(touch)
        @move.call(this, touch)
      else
        @enter.call(this, touch)
        @touches.push touch
    else
      if @hasTouch(touch)
        @leave.call(this, touch)
        @touches.splice @touches.indexOf(touch), 1
      
  handleEnd: (touch) ->
    if @hasTouch(touch)
      @end.call(this, touch)
      @touches.splice @touches.indexOf(touch), 1
      
  # Empty placeholders
  start: ->
  move: ->
  end: ->
  enter: ->
  leave: ->