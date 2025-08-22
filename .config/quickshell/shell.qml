import Quickshell
import QtQuick

import "modules/bar"
import "modules/watermark"

ShellRoot {
    Bar {}

    PanelWindow {
        id: window
        visible: true
        color: "transparent"
        implicitWidth: background.width
        implicitHeight: background.height

        function hide() {
            visible = false;
        }

        anchors {
            bottom: true
            left: true
            right: true
        }

        mask: Region {
            item: background
        }

        Rectangle {
            id: background
            implicitWidth: 200
            implicitHeight: 200
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            color: "teal"
        }
    }
}
