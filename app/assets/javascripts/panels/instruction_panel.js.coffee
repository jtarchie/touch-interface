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
  start: ->
    @owner.attr('fill', '#c0c0c0')
  move: -> @start()
  leave: -> @end()
  enter: -> @start()
  end: ->
    if @touches.length == 1
      @owner.attr('fill', '#fff')