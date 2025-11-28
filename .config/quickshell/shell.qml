import Quickshell
import Quickshell.Io
import QtQuick

Variants {
    model: Quickshell.screens

    delegate: Component {
        PanelWindow {
            required property var modelData

            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30
            CustomText {
                id: clock
                text: "Hello!"

                Process {
                    id: dateProc
                    command: ["date"]
                    running: true

                    stdout: StdioCollector {
                        onStreamFinished: clock.text = text
                    }
                }

                Timer {
                    interval: 1000
                    running: true
                    repeat: true

                    onTriggered: dateProc.running = true
                }
            }
        }
    }
}
