import fabric
from fabric import Application
from fabric.widgets.datetime import DateTime
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.wayland import WaylandWindow as Window
from fabric.core.service import Service, Signal, Property


class NameService(Service):
    @Signal
    def name_changed(self, new_name: str) -> None: ...

    @Property(str, flags="read-write")
    def name(self) -> str:
        return self._name

    @name.setter
    def name(self, value: str):
        self._name = value
        self.name_changed(value)

    def __init__(self, name: str | None = None):
        super().__init__
        self._name = name or ""


class StatusBar(Window):
    def __init__(self, **kwargs):
        super().__init__(
            layer="top", anchor="left top right", exclusivity="auto", **kwargs
        )
        self.date_time = DateTime()
        self.children = CenterBox(center_children=self.date_time)


name_service = NameService()

name_service.connect(
    "name-changed",
    lambda new_name: print(f"the name has changed, new name is {new_name}"),
)

name_service.name = "Homan"

if __name__ == "__main__":
    bar = StatusBar()
    app = Application("bar", bar)
    app.run()
