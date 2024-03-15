package logged;

public class LoginManager {
    private static int loggedIn = 0;

    public static int getLoggedIn() {
        return loggedIn;
    }
    public static void setLoggedIn(int loggedIn) {
        LoginManager.loggedIn = loggedIn;
    }
}
