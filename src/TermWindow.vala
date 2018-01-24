public class TermWindow : Gtk.Window {
    public TermWindow (Gtk.Application application) {
        Object (
            application: application,
            title: "RAD Term",
            width_request: 700,
            height_request: 500
        );
    }
}
