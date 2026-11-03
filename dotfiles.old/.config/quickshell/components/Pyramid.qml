import QtQuick

Item {
    id: pyramid
    Canvas {
        anchors.fill: parent

        onPaint: {
            let ctx = getContext("2d");

            function mat_mul(a, b) {
                const res = [];
                for (let r = 0; r < a.rows_cnt; ++r) {
                    for (let c = 0; c < b.cols_cnt; ++c) {
                        let acc = 0;
                        for (let i = 0; i < b.rows_cnt; ++i) {
                            acc += a.val[r * a.cols_cnt + i] * b.val[i * b.cols_cnt + c];
                        }
                        res[r * b.cols_cnt + c] = acc;
                    }
                }
                return {
                    rows_cnt: a.rows_cnt,
                    cols_cnt: b.cols_cnt,
                    val: res
                };
            }

            function iso_projection(x, y, z) {
                const alpha = Math.asin(Math.tan(Math.PI / 8)); // arcsin(tan(30))
                const beta = Math.PI / 3;

                const a = {
                    rows_cnt: 3,
                    cols_cnt: 1,
                    val: [x, y, z]
                };

                const m_one = {
                    rows_cnt: 3,
                    cols_cnt: 3,
                    val: [
                      1, 0, 0,
                      0, Math.cos(alpha), -Math.sin(alpha),
                      0, Math.sin(alpha), Math.cos(alpha)
                    ]
                };

                const m_two = {
                  rows_cnt: 3,
                  cols_cnt: 3,
                  val: [
                    Math.cos(beta), 0, -Math.sin(beta),
                    0, 1, 0,
                    Math.sin(beta), 0, Math.cos(beta)
                  ]
                }

                let tmp = mat_mul(m_one, m_two);
                tmp = mat_mul(tmp, a)

                return {
                    x: tmp.val[0],
                    y: tmp.val[1]
                };
            }

            const ox = 300;
            const oy = 300;
            const oz = 0;
            const r = 50;

            let points = [
                {
                    x: 0,
                    y: 0,
                    z: 0
                },
                {
                    x: -r,
                    y: r,
                    z: r
                },
                {
                    x: r,
                    y: r,
                    z: r
                },
                {
                    x: -r,
                    y: r,
                    z: -r
                },
                {
                    x: r,
                    y: r,
                    z: -r
                }
            ];
            const projected = points.map(v => iso_projection(v.x, v.y, v.z));
            const edges = [[0, 1], [0, 2], [0, 3], [0, 4], [3, 4], [1, 3], [1, 2]];
            ctx.strokeStyle = "#00ffcc";
            ctx.lineWidth = 2.5;
            edges.forEach(e => {
                ctx.beginPath();
                ctx.moveTo(projected[e[0]].x + width / 2, projected[e[0]].y + height / 2);
                ctx.lineTo(projected[e[1]].x + width / 2, projected[e[1]].y + height / 2);
                ctx.stroke();
            });
        }
    }
}
