class @Application
  constructor: ->
    @document = $(document)
    @paper = Raphael(0, 0, @width(), @height())
    @canvas = @paper.rect(0, 0, @width(), @height()).attr(
      fill: '#000000'
    )

  run: ->
    @instructionPanel = new InstructionPanel(this)
    @programPanel = new ProgramPanel(this)
    @designPanel = new DesignPanel(this)
    @runPanel = new RunPanel(this)
    
    new ApplicationTouchEvents(@canvas)
      
  width: -> @document.width()
  height: -> @document.height()

class @ApplicationTouchEvents extends TouchEventsDelegator
  start: (touch) ->
    @touches[touch.identifier] = @owner.paper.circle(touch.pageX, touch.pageY, 10).attr('fill', '#ffffff')
  move: (touch) ->
    @touches[touch.identifier].animate(
              cx: touch.pageX,
              cy: touch.pageY
            , 10)
  end: (touch) ->
    @touches[touch.identifier].remove();
    delete @touches[touch.identifier];