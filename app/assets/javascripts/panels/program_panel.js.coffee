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
  start: (touch) ->
    @owner.attr('fill', '#ff0000') if @contains(touch)
  move: (touch) ->
    @start(touch)
  end: (touch) ->
    @owner.attr('fill', '#000000') if @contains(touch)