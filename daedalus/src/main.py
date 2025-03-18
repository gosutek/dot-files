from fabric import Application
from fabric.utils import get_relative_path
from fabric.widgets.label import Label
from fabric.widgets.wayland import WaylandWindow
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.box import Box


class Bar(WaylandWindow):
    def __init__(self, **kwargs):
        super().__init__(
            name="bar",
            layer="top",
            anchor="left top right",
            margin="-4px -4px -8px -4px",
            exclusivity="auto",
            visible=True,
            all_visible=True,
        )

        self.bar_inner = CenterBox(
            name="bar-inner",
            orientation="h",
            h_align="fill",
            v_align="center",
            start_children=Box(
                name="start-container",
                spacing=4,
                orientation="h",
                children=[Label("I am a child of the start")],
            ),
            end_children=Box(
                name="end-container",
                spacing=4,
                orientation="h",
                children=[Label("I am a child of the end")],
            ),
        )

        self.children = self.bar_inner


if __name__ == "__main__":
    app = Application("default", Bar())

    def set_css():
        app.set_stylesheet_from_file(get_relative_path("main.css"))

    app.set_css = set_css
    app.set_css()
    app.run()
