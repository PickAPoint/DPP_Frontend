import { writable } from 'svelte/store';

export const session = writable({
    id: undefined,
    type: undefined,
    name: undefined,
    email: undefined,
    address: undefined,
    token: undefined
});
