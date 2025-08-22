import QtQuick.Controls
import Quickshell
import Quickshell.Io

Button {
    text: "Ok"

    function log() {
        console.log("Hello");
    }
    onClicked: log()
}
