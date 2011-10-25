class @TouchEventsDelegator
  constructor: (@owner) ->
    @touches = {}
    @document = $("body")
    @document.bind "touchstart", (event) => @operateTouch event, @start
    @document.bind "touchmove", (event) => @operateTouch event, @move
    @document.bind "touchend", (event) => @operateTouch event, @end
    @document.bind "touchcancel", (event) => @operateTouch event, @end
	
  operateTouch: (event, func) ->
    originalEvent = event.originalEvent
    originalEvent.preventDefault()
    for touch in event.originalEvent.changedTouches
      break if func.call(this, touch)?

  contains: (touch) ->
    bbox = @owner.getBBox()
    bbox.x <= touch.pageX < bbox.x + bbox.width and
    bbox.y <= touch.pageY < bbox.y + bbox.height
  
  start: ->
  move: ->
  end: ->