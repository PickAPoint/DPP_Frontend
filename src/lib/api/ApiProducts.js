import { API_URL } from "$lib/env";
import axios from "axios";

export const ApiProducts = {
    get: async function() {
        const url = `${API_URL}/api/v1/plates`;
        const response = await axios.get(url);
        return { products : response.data }
    },
    getByProductIdUserId: async function(productId, userId) {
        const url = `${API_URL}/api/v1/plates/${productId}?userId=${userId}`;
        const response = await axios.get(url);
        return response.data
    }
}