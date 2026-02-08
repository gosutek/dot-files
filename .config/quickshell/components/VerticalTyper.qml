import QtQuick
import QtQuick.Layouts

Item {
  id: typer
  Layout.fillWidth: true
  Layout.fillHeight: true

  property string text: ""
  property int font_size: 24
  property string font_family: "Helvetica"
  property color text_color: "white"
  property int cursor_size: 5
  property int typing_speed: 200

  property string displayed_text: ""
  property int current_idx: 0

  Column {

    id: text_column
    spacing: 5
    anchors.centerIn: parent

    Repeater {
      model: typer.displayed_text.length
      Text {
        text: typer.displayed_text[index]
        font.pixelSize: typer.font_size
        font.family: typer.font_family
        color: typer.text_color
        anchors.horizontalCenter: parent.horizontalCenter
      }
    }

    Rectangle {
      id: cursor_rect
      width: typer.cursor_size
      height: typer.cursor_size
      radius: width / 2
      color: typer.text_color
      visible: false
      anchors.horizontalCenter: parent.horizontalCenter
    }
  }

  Timer {
    id: typing_timer
    interval: typer.typing_speed
    running: true
    repeat: true
    onTriggered: {
      if (typer.current_idx < typer.text.length) {
        typer.displayed_text += typer.text[typer.current_idx]
        typer.current_idx++
      } else {
        stop()
        cursor_timer.running = true
      }
    }
  }

  Timer {
    id: cursor_timer
    interval: 500
    repeat: true
    running: false
    onTriggered: cursor_rect.visible = !cursor_rect.visible
  }

  onTextChanged: {
    displayed_text = ""
    current_idx = 0
    cursor_rect.visible = false
    cursor_timer.running = false
    typing_timer.restart()
  }
}
