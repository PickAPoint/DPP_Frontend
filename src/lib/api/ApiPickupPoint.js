import axios from "axios";
import { API_URL } from "$lib/env";

export const ApiPickupPoint = {

    getPackages: async function(pickupPointId) {
        const url = `${API_URL}/partner/packages?partnerId=${pickupPointId}`;

        const response = await axios.get(url);
        return response.data
    },

    getPackage: async function(packageId) {
        const url = `${API_URL}/partner/package/${packageId}`;

        const response = await axios.get(url);
        return response.data
    },

    updatePackageState: async function(payload) {
        const url = `${API_URL}/partner/package`;

        const response = await axios.put(url, payload);
        return response.data
    },

}