import { API_URL } from "$lib/env";
import axios from "axios";

export const ApiCart = {
    getCartByUserId: async function(userId) {
        const url = `${API_URL}/api/v1/cart?userId=${userId}`;
        const response = await axios.get(url);
        return response.data;
    },
    addPlateToCart: async function(userId, plateId, quantity){
        const url = `${API_URL}/api/v1/cart?userId=${userId}&plateId=${plateId}&quantity=${quantity}`;
        await axios.post(url);
    },
    clearCartByUserId: async function(userId){
        const url = `${API_URL}/api/v1/cart?userId=${userId}&plateId=-1`;
        await axios.delete(url);
    },
    checkoutByUserId: async function(userId, products){
        const url = `${API_URL}/api/v1/checkout?userId=${userId}`;
        const data = {
            "items":  products.map((product) => {
                return {
                    "plate": {
                        "id": product.plate.id
                    },
                    "quantity": product.quantity
                }
            })
        }
        console.log(data);
        await axios.post(url, data);
    }
}
