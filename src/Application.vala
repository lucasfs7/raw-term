public class RawTerm : Gtk.Application {
    public RawTerm () {
        Object (
            application_id: "com.github.lucasfs7.raw-term",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var term_window = new TermWindow (this);

        term_window.show_all ();

        var quit_action = new SimpleAction ("quit", null);

        add_action (quit_action);
        add_accelerator ("<Control>q", "app.quit", null);

        quit_action.activate.connect (() => {
            if (term_window != null) {
                term_window.destroy ();
            }
        });
    }

    public static int main (string[] args) {
        var app = new RawTerm ();
        return app.run (args);
    }
}
