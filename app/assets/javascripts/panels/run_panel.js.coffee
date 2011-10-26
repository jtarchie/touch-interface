class @RunPanel extends Panel
  init: ->
    @container = @app.paper.rect(
      InstructionPanel.width, app.height() / 2,
      app.width(), app.height() / 2
    ).attr(
      'fill': '#000000'
      'stroke': '#c0c0c0'
    )
    
    new RunPanelTouchEvents(@container)
    new RunPanelGestureEvents(@container)
  draw: ->
    

class @RunPanelTouchEvents extends TouchEventsDelegator
  start: ->
    @owner.attr('fill', '#00ff00')
  move: -> @start()
  leave: ->@end()
  enter: -> @start()
  end: ->
    if @touches.length == 1
      @owner.attr('fill', '#000000')

class @RunPanelGestureEvents extends GestureEventsDelegator
  start: ->
    @last_scale = 1
    @last_rotation = 1
  scale: (gesture) ->
    @owner.scale(gesture.scale / @last_scale)
    @last_scale = gesture.scale
  rotation: (gesture) ->
    @owner.rotate(gesture.rotation / @last_rotation)
    @last_scale = gesture.scale
  end: ->
    console.log "end"