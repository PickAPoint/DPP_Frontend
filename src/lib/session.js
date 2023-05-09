import { writable } from 'svelte/store';

export const session = writable({
    userId: undefined,
    userType: undefined,
    userFname: undefined,
    userLname: undefined,
    userEmail: undefined,
    token: undefined
});
