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
  start: (touch) ->
    @owner.attr('fill', '#0000ff') if @contains(touch)
  move: (touch) ->
    @start(touch)
  end: (touch) ->
    @owner.attr('fill', '#000000') if @contains(touch)