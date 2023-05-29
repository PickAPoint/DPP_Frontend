import axios from "axios";
import { API_URL } from "$lib/env";

export const ApiAdmin = {

    adminDashboard: async function() {
        const papURL = `${API_URL}/admin/users`;
        const packURL = `${API_URL}/admin/packages`;

        let response = null;

        await axios.all([
            axios.get(papURL), 
            axios.get(packURL),
          ])
          .then(axios.spread((data1, data2) => {
            response = {'data1': data1.data, 'data2': data2.data}
          }));

        return response;
    },

    adminPackages: async function() {
        const url = `${API_URL}/admin/packages`;
        const response = await axios.get(
          url,
        );

        return response.data;
    },

    adminPackage: async function(packageId) {
      const url = `${API_URL}/admin/package/${packageId}`;

      const response = await axios.get(
        url,
      );
      return response.data
    },

    adminUpdatePackage: async function(item, newState) {
      const url = `${API_URL}/admin/package`;

      const payload = {
        packageId: item.id,
        newState: newState,
        token: item.token
      }

      const response = await axios.put(
        url,
        payload,
      );
      return response.data
    },

    adminUsers: async function() {
      const url = `${API_URL}/admin/users`;
      const response = await axios.get(
        url,
      );
      
      return response.data;
    },

    adminAcceptUser: async function(userId) {
      const url = `${API_URL}/admin/validate/${userId}`;

      const response = await axios.post(
        url,
      );
      return response.data
    },

    adminDeleteUser: async function(userId) {
      const url = `${API_URL}/admin/users/${userId}`;

      const response = await axios.delete(
        url,
      );
      return response.data
    },
    

}