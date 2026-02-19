import "../components"

import Quickshell
import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

Variants {
  model: Quickshell.screens

  delegate: Component {
    PanelWindow {
      id: root
      required property var modelData
      screen: modelData

      property real design_height: 1440
      property real scale: modelData.geometry.height / design_height

      anchors {
          top: true
          left: true
          right: true
          bottom: true
      }

      color: "#000000"
      aboveWindows: false

      RowLayout {
        anchors.fill: parent
        anchors.margins: 100
        spacing: 20

        StyledRect {
          Layout.fillWidth: true
          Layout.fillHeight: true
          color_1: "#d71f29"
          color_2: "#101010"

          ColumnLayout {
            anchors.fill: parent

            AbstractShape {}

            Item {
              id: rose_icon
              Layout.fillWidth: true
              Layout.fillHeight: true
              opacity: 0.0

              Image {
                anchors.centerIn: parent
                source: "../assets/rose.svg"
                antialiasing: true
                id: rose_svg
                visible: false
                fillMode: Image.PreserveAspectFit
                width: parent.width * .5
              }

              ColorOverlay {
                anchors.fill: rose_svg
                source: rose_svg
                color: "#801B23"
                antialiasing: true
              }

              Behavior on opacity {
                NumberAnimation {
                  duration: 1200
                  easing.type: Easing.InOutCubic
                }
              }
              Component.onCompleted: opacity = 1.0
            }

            VerticalTyper {
              id: typer
              Layout.fillWidth: true
              Layout.fillHeight: true
              text: "ネルフ"
              typing_speed: 150
              font_size: 28
            }

            Item {
              Layout.fillWidth: true
              Layout.fillHeight: true
            }
          }
        }

        StyledRect {
          Layout.fillHeight: true
          Layout.preferredWidth: parent.width * (4 / 6)
          color_1: "#d71f29"
          color_2: "#101010"

          ColumnLayout {
            anchors.fill: parent
            spacing: 50
            ColumnLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredHeight: 0

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.leftMargin: 330
                    Layout.rightMargin: 330

                    Text {
                        text: "LVL"
                        font.pointSize: 14
                        font.family: "Helvetica"
                        color: "#9f9f9f"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.top: parent.top
                    }
                }
                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.leftMargin: 330
                    Layout.rightMargin: 330

                    Column {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 20
                        Text {
                            text: "SECURITY"
                            font.pointSize: 12
                            font.family: "Helvetica"
                            color: "#9f9f9f"
                        }

                        Text {
                            text: "PERSONAL CODE"
                            font.pointSize: 10
                            font.family: "Helvetica"
                            color: "#9f9f9f"
                        }
                    }

                }
            }

              Image {
                  id: img
                  source: "../assets/central_dogma.svg"
                  Layout.alignment: Qt.AlignCenter
                  Layout.preferredWidth: 1500
                  Layout.preferredHeight: 200
                  fillMode: Image.PreserveAspectFit
              }

              ColumnLayout {
                  Layout.fillWidth: true
                  Layout.fillHeight: true
                  Layout.preferredHeight: 0

                  Item {
                      Layout.fillWidth: true
                      Layout.fillHeight: true
                      Layout.leftMargin: 330
                      Layout.rightMargin: 330

                      Text {
                          text: "FINAL GATE"
                          font.bold: true
                          font.pointSize: 14
                          font.family: "Helvetica"
                          color: "#9f9f9f"
                          anchors.left: parent.left
                          anchors.verticalCenter: parent.verticalCenter
                          anchors.top: parent.top
                      }

                      Row {
                          anchors.right: parent.right
                          anchors.top: parent.top
                          spacing: 10

                          Text {
                              text: "STATUS"
                              font.pointSize: 14
                              font.family: "Helvetica"
                              color: "#7a7a7a"
                          }

                          Rectangle {
                              width: 200
                              color: "#7a7a7a"
                              anchors.verticalCenter: parent.verticalCenter
                              anchors.top: parent.top

                              Text {
                                  text: "LOCKED"
                                  font.pointSize: 14
                                  font.bold: true
                                  font.family: "Helvetica"
                                  color: "#ffffff"
                                  anchors.centerIn: parent
                              }
                          }
                      }

                      Row {
                          anchors.right: parent.right
                          anchors.verticalCenter: parent.verticalCenter
                          Text {
                              text: "INSERT CARD "
                              font.pointSize: 14
                              font.family: "Helvetica"
                              color: "#7a7a7a"
                          }
                          Text {
                              text: "FULLY"
                              font.pointSize: 14
                              font.bold: true
                              font.family: "Helvetica"
                              color: "#afafaf"
                          }
                      }
                  }
                  Item {
                      Layout.fillWidth: true
                      Layout.fillHeight: true
                  }
                  Item {
                      Layout.fillWidth: true
                      Layout.fillHeight: true
                  }
              }
          }

            Rectangle { // mask
                id: mask_rect_top
                anchors.top: parent.top
                anchors.right: parent.right
                width: 40
                height: 40
                color: "#000000"
            }

            Rectangle {
                id: rotatingSquare_top
                anchors.centerIn: mask_rect_top
                width: 15
                height: 15
                color: "#7a7a7a"

                transformOrigin: Item.Center

                RotationAnimator on rotation {
                    from: 0
                    to: 330
                    duration: 2000
                    loops: Animation.Infinite
                }
            }

            Rectangle { // mask
                id: mask_rect_bottom
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 40
                height: 40
                color: "#000000"
            }

            Rectangle {
                id: rotatingSquare_bottom
                anchors.centerIn: mask_rect_bottom
                width: 15
                height: 15
                color: "#7a7a7a"

                transformOrigin: Item.Center

                RotationAnimator on rotation {
                    from: 0
                    to: 330
                    duration: 2000
                    loops: Animation.Infinite
                }
            }

        }

        Rectangle {
          Layout.preferredHeight: parent.height * .936
          Layout.preferredWidth: 200
          Layout.leftMargin: -20
          Layout.rightMargin: -20

          gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#101010" }
            GradientStop { position: 0.5; color: "#050505" }
            GradientStop { position: 1.0; color: "#101010" }
          }

          Image {
            source: "../assets/item.svg"
            height: parent.height * 1.205
            sourceSize.width: width
            sourceSize.height: height
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
          }
        }

        Rectangle {
          Layout.fillHeight: true
          Layout.fillWidth: true
          color: "#101010"

            Rectangle { // mask
                id: mask_rect_top_1
                anchors.top: parent.top
                anchors.left: parent.left
                width: 40
                height: 40
                color: "#000000"
            }

            Rectangle {
                id: rotatingSquare_top_1
                anchors.centerIn: mask_rect_top_1
                width: 15
                height: 15
                color: "#7a7a7a"

                transformOrigin: Item.Center

                RotationAnimator on rotation {
                    from: 0
                    to: 330
                    duration: 2000
                    loops: Animation.Infinite
                }
            }

            Rectangle { // mask
                id: mask_rect_bottom_1
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                width: 40
                height: 40
                color: "#000000"
            }

            Rectangle {
                id: rotatingSquare_bottom_1
                anchors.centerIn: mask_rect_bottom_1
                width: 15
                height: 15
                color: "#7a7a7a"

                transformOrigin: Item.Center

                RotationAnimator on rotation {
                    from: 0
                    to: 330
                    duration: 2000
                    loops: Animation.Infinite
                }
            }
        }
      }
      Component.onCompleted: {
        console.log("Screen height:", root.modelData.geometry.height)
      }
    }
  }
}

