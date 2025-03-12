from fabric import Application
from fabric.widgets.label import Label
from fabric.widgets.wayland import Window
from fabric.hyprland.widgets import Workspaces


class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            name="bar",
            layer="top",
            anchor="left top right",
            margin="-4px -4px -8px -4px",
            exclusivity="auto",
            visible=True,
            all_visible=True,
            child=Label("Hello, World"),
        )

        self.workspaces = Workspaces(
            name="workspaces",
            invert_scroll=True,
            empty_scroll=True,
            v_align="fill",
            orientation="h",
            spacing=10,
        )


app = Application("default", Bar())
app.run()
