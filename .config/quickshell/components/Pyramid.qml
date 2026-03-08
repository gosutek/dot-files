import QtQuick

Canvas {
  id: canvas
  anchors.fill: parent

  property real angle: -60

  function project(x, y, z, fov, viewDist) {
    var factor = fov / (viewDist + z)
    return Qt.point(x * factor + width / 2, -y * factor + height / 2)
  }

  function rotateY(x, y, z, a) {
    return {
        x: x * Math.cos(a) + z * Math.sin(a),
        y: y,
        z: -x * Math.sin(a) + z * Math.cos(a)
    }
  }

  function rotateX(x, y, z, a) {
    return {
        x: x,
        y: y * Math.cos(a) - z * Math.sin(a),
        z: y * Math.sin(a) + z * Math.cos(a)
    }
  }

  onPaint: {
    let ctx = getContext("2d")
    ctx.clearRect(0, 0, width, height)

    let a = angle
    let tilt = 0.4  // slight X rotation so we see the base

    const h = 150;
    const r = 100;

    // Define pyramid vertices: apex at top, square base
    var rawVerts = [
      { x:  0,   y:  h, z:  0   },
      { x: r, y: 0, z: r },
      { x: r, y: 0, z: -r },
      { x: -r, y: 0, z: -r },
      { x: -r, y: 0, z: r }
    ]

    // Edges: 4 sides + 4 base edges
    var edges = [
        [0,1],[0,2],[0,3],[0,4],  // apex to each base corner
        [1,2],[2,3],[3,4],[4,1],  // base square
    ]

    // Rotate all vertices
    var verts = rawVerts.map(function(v) {
        var r = rotateY(v.x, v.y, v.z, a)
        return rotateX(r.x, r.y, r.z, tilt)
    })

    // Project to 2D
    var fov = 200
    var viewDist = 1000
    var projected = verts.map(function(v) {
        return project(v.x, v.y, v.z, fov, viewDist)
    })

    // Draw edges
    ctx.strokeStyle = "#00ffcc"
    ctx.lineWidth = 1.8
    ctx.shadowColor = "#00ffcc"
    ctx.shadowBlur = 8

    edges.forEach(function(e) {
        ctx.beginPath()
        ctx.moveTo(projected[e[0]].x, projected[e[0]].y)
        ctx.lineTo(projected[e[1]].x, projected[e[1]].y)
        ctx.stroke()
    })

    // Draw vertex dots
    ctx.fillStyle = "#00ffcc"
    projected.forEach(function(p) {
        ctx.beginPath()
        ctx.arc(p.x, p.y, 3, 0, Math.PI * 2)
        ctx.fill()
    })
  }

  // NumberAnimation on angle {
  //   from: 0; to: Math.PI * 2
  //   duration: 4000
  //   loops: Animation.Infinite
  // }

  onAngleChanged: requestPaint()
}
