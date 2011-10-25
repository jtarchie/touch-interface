class @InstructionPanel extends Panel
  @width: 50
  init: ->
    @container = @app.paper.rect(0, 0, InstructionPanel.width, app.height()).attr(
      stroke: '#c0c0c0',
      fill: '#fff'
    )
    
    new InstructionPanelTouchEvents(@container)
  draw: ->
    
class @InstructionPanelTouchEvents extends TouchEventsDelegator
  start: (touch) ->
    @owner.attr('fill', '#c0c0c0') if @contains(touch)
  move: (touch) ->
    @start(touch)
  end: (touch) ->
    @owner.attr('fill', '#fff') if @contains(touch)