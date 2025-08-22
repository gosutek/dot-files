pragma ComponentBehavior: Bound

import Quickshell
import QtQuick.Controls

import "../../services"
import "components"

Scope {
    Time {
        id: timeSource
    }

    Variants {
        model: Quickshell.screens

        // Object assigned to the parent's default property
        PanelWindow {
            // Property declaration
            required property var modelData

            // Property binding
            screen: modelData

            // Multiline property binding
            anchors {
                top: true
                left: true
                right: true
            }

            // Property binding
            implicitHeight: 30

            // Object assigned to the parent's default property
            Clock {
                // Property binding
                anchors.centerIn: parent
                // Property binding
                time: timeSource.time
            }

            DebugButton {}

        }
    }
}
