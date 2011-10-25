class @RunPanel extends Panel
  init: ->
    @container = @app.paper.rect(
      InstructionPanel.width, app.height() / 2,
      app.width() * 2, app.height() * 2
    ).attr(
      'fill': '#000000'
      'stroke': '#c0c0c0'
    )
    
    new RunPanelTouchEvents(@container)
  draw: ->
    

class @RunPanelTouchEvents extends TouchEventsDelegator
  start: (touch) ->
    @owner.attr('fill', '#00ff00') if @contains(touch)
  move: (touch) ->
    @start(touch)
  end: (touch) ->
    @owner.attr('fill', '#000000') if @contains(touch)