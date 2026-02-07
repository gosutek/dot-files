import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
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

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#101010"
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * (4 / 6)
            color: "#101010"

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
                        Layout.leftMargin: 360
                        Layout.rightMargin: 360

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
                        Layout.leftMargin: 360
                        Layout.rightMargin: 360

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
                    source: "central_dogma.svg"
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: 1440
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
                        Layout.leftMargin: 360
                        Layout.rightMargin: 360

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
                    to: 360
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
                    to: 360
                    duration: 2000
                    loops: Animation.Infinite
                }
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#101010"
        }
    }


}
