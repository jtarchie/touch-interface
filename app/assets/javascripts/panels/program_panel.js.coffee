class @ProgramPanel extends Panel
  init: ->
    @container = @app.paper.rect(
      InstructionPanel.width, 0,
      (app.width() - InstructionPanel.width) / 2, app.height() / 2
    ).attr(
      'fill': '#000000',
      'stroke': '#c0c0c0'
    )
    
    new ProgramPanelTouchEvents(@container)
  draw: ->

class @ProgramPanelTouchEvents extends TouchEventsDelegator
  start: ->
    @owner.attr('fill', '#ff0000')
  move: -> @start()
  leave: -> @end()
  enter: -> @start()
  end: ->
    if @touches.length == 1
      @owner.attr('fill', '#000000')