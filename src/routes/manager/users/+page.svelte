<script>
    import { Button, Table, TableBody, TableHead, TableBodyRow, TableBodyCell, TableHeadCell } from 'flowbite-svelte';
    import { onMount } from "svelte";
    import AllUsers from './AllUsers.svelte';
    import UserJoinRequest from './UserJoinRequest.svelte';
    import RefusedUsers from './RefusedUsers.svelte';
    import { ApiAdmin } from '$lib/api/ApiAdmin';
    
    import "@carbon/styles/css/styles.css";
    import "@carbon/charts/styles.css";

    let current_users = [];
    let request_users = [];

    onMount(async () => {
        
        //api call to get Users
        ApiAdmin.adminUsers()
        .then(data => {
            // current_users is all users that are not pending
            current_users = data.filter(
                user => user.type == "Partner"
            );
            
            request_users = data.filter(
                user => user.type == "Pending"
            );


            
        })
        .catch(err => {
            console.log(err);
        })

    })
    
    
</script>

<div class="container my-12">

    <div>
        <p class="text-4xl font-bold inline-block">Pick Up Point Management</p>
        <span class="font-extralight italic mx-1 text-lg">Administrator</span>
    </div>
    <div class="h-8"></div>

    <div>
        <AllUsers bind:items={current_users}/>
    </div>
    <div class="h-14"></div>

    <div>
        <p class="text-2xl font-bold inline-block">Join Us Requests</p>
    </div>
    <div class="h-8"></div>

    <div>
        <UserJoinRequest bind:users={request_users} bind:items={current_users}/>
    </div>
    <div class="h-14"></div>

</div>

