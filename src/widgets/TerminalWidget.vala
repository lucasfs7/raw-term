public class TerminalWidget : Vte.Terminal {

    public TerminalWidget () {
        start ();
    }

    protected void start () {
        var shell = Vte.get_user_shell ();

        spawn_sync (
            Vte.PtyFlags.DEFAULT,
            null,
            { shell },
            null,
            SpawnFlags.SEARCH_PATH,
            null,
            null,
            null
        );
    }
}
