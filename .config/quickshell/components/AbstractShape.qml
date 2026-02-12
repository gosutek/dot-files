import QtQuick
import QtQuick.Shapes

Item {
  id: abstract_shape
  width: 400
  height: 400

  Shape {
    id: shape1

    ShapePath {
      strokeWidth: 0
      fillColor: "#9f9f9f"

      startX: 50
      startY: 50

      PathLine {
        x: 70
        y: 50
      }

      PathLine {
        x: 70
        y: 70
      }
    }

    ShapePath {
      strokeWidth: 1
      strokeColor: "#9f9f9f"

      startX: 70
      startY: 70

      PathLine {
        x: 85
        y: 85
      }
    }
  }

  Shape {
    id: shape2

    ShapePath {
      strokeWidth: 0
      fillColor: "#9f9f9f"

      startX: 85
      startY: 85

      PathLine {
        x: 50
        y: 85
      }

      PathLine {
        x: 67.5
        y: 100
      }
    }
  }

  Shape {
    id: shape3

    ShapePath {
      strokeWidth: 0
      fillColor: "#9f9f9f"

      startX: 50
      startY: 80

      PathLine {
        x: 40
        y: 80
      }

      PathLine {
        x: 40
        y: 90
      }

      PathLine {
        x: 50
        y: 90
      }
    }
  }
}
