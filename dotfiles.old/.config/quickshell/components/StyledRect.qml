import QtQuick

Item {
  id: root

  property color color_1: "red"
  property color color_2: "blue"
  property bool inverted: false

  readonly property color line_color: inverted ? color_2 : color_1
  readonly property color background_color: inverted ? color_1 : color_2

  Canvas {
    id: canvas
    anchors.fill: parent

    onPaint: {
      var ctx = getContext("2d");
      ctx.reset()

      ctx.fillStyle = root.background_color
      ctx.fillRect(0, 0, width, height)
      const offsets = [4, 10];

      for (const offset of offsets) {
        const o = offset + 0.5
        ctx.strokeStyle = root.line_color
        ctx.lineWidth = 2
        ctx.beginPath()
        ctx.rect(o, o, width - o * 2, height - o * 2)
        ctx.stroke()
      }

    }
  }
}
