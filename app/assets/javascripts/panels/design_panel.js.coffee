class @DesignPanel extends Panel
  init: ->
    @container = @app.paper.rect(
      (app.width() + InstructionPanel.width) / 2, 0,
      app.width() / 2, app.height() / 2
    ).attr(
      'fill': '#000000',
      'stroke': '#c0c0c0'
    )
    
    new DesignPanelTouchEvents(@container)

class @DesignPanelTouchEvents extends TouchEventsDelegator
  start: ->
    @owner.attr('fill', '#0000ff')
  move: -> @start()
  leave: -> @end()
  enter: -> @start()
  end: ->
    if @touches.length == 1
      @owner.attr('fill', '#000000')