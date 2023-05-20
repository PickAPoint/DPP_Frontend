import axios from "axios";
import { API_URL } from "$lib/env";

export const ApiPickupPoint = {

    getPackages: async function(pickupPointId) {
        const url = `${API_URL}/partner/packages?partnerId=${pickupPointId}`;

        const response = await axios.get(url);
        return response.data
    },

}