import axios from "axios";
import { API_URL } from "$lib/env";

export const ApiAuth = {
    login: async function(email, password) {
        const url = `${API_URL}/auth/login`;
        const data = {
            email: email.toString(),
            password: password.toString()
        };
        const response = await axios.post(url, data);
        return response.data
    },
    register: async function(fname, lname, email, password) {
        const url = `${API_URL}/auth/register`;
        const data = {
            "fname": fname.toString(),
            "lname": lname.toString(),
            "email": email.toString(),
            "password": password.toString()
        };
        const response = await axios.post(url, data);
        return response.data === "success";
    }
}