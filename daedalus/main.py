import fabric
from fabric.widgets.box import Box
from fabric.widgets.label import Label
from fabric.widgets.wayland import Window


class Bar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            name="bar",
            layer="top",
        )
