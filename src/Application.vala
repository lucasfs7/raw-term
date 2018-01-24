public class RADTerm : Gtk.Application {
    public RADTerm () {
        Object (
            application_id: "com.github.lucasfs7.rad-term",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var term_window = new TermWindow (this);

        term_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new RADTerm ();
        return app.run (args);
    }
}
