import { API_URL } from "$lib/env";
import axios from "axios";

export const ApiOrders = {
    getOrdersByUserId: async function(userId) {
        const url = `${API_URL}/api/v1/orders?userId=${userId}`;
        const response = await axios.get(url);
        return response.data;
    },
    cancelOrder: async function(orderId){
        const url = `${API_URL}/api/v1/orders?orderId=${orderId}`;
        await axios.delete(url);
    }
}