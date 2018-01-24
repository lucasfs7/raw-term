public class TerminalWidget : Vte.Terminal {
    GLib.Pid child_pid;

    public TerminalWidget () {
        start ();
    }

    protected void start () {
        string shell = Vte.get_user_shell ();

        spawn_sync (
            Vte.PtyFlags.DEFAULT,
            null,
            { shell },
            null,
            SpawnFlags.SEARCH_PATH,
            null,
            out this.child_pid,
            null
        );
    }
}
