import { session } from "$lib/session";

const storedSession = JSON.parse(localStorage.getItem("session"));

if (storedSession) {
    session.set(storedSession);
}