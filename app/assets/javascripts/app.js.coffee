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
  dots: {}
  start: (touch) ->
    @dots[touch.identifier] = @owner.paper.circle(touch.pageX, touch.pageY, 10).attr('fill', '#ffffff')
  move: (touch) ->
    @dots[touch.identifier].animate(
              cx: touch.pageX,
              cy: touch.pageY
            , 10)
  end: (touch) ->
    dot = @dots[touch.identifier]
    dot.animate(
      {
        cy: $(document).height(),
      },
      @dots[touch.identifier].attr("cy") * 10,
      "bounce", => dot.remove()
    )
    delete @dots[touch.identifier]