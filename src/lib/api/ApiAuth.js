import axios from "axios";
import { API_URL } from "$lib/env";

export const ApiAuth = {

    login: async function(payload) {
        const url = `${API_URL}/auth/login`;

        const response = await axios.post(url, payload);
        return response.data
    },


    register: async function(payload) {
        const url = `${API_URL}/auth/register`;

        const response = await axios.post(url, payload);
        return response.data;
    }

}