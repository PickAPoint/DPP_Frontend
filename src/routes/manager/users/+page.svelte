<script>
    import { Button, Table, TableBody, TableHead, TableBodyRow, TableBodyCell, TableHeadCell } from 'flowbite-svelte';
    import AllUsers from './AllUsers.svelte';
    import UserJoinRequest from './UserJoinRequest.svelte';
    
    import "@carbon/styles/css/styles.css";
    import "@carbon/charts/styles.css";


    
</script>

<div class="container my-12">

    <div>
        <p class="text-4xl font-bold inline-block">Pick Up Point Management</p>
        <span class="font-extralight italic mx-1 text-lg">Administrator</span>
    </div>
    <div class="h-8"></div>

    <div>
        <AllUsers />
    </div>
    <div class="h-14"></div>

    <div>
        <p class="text-2xl font-bold inline-block">Join Us Requests</p>
    </div>
    <div class="h-8"></div>

    <div>
        <UserJoinRequest />
    </div>


</div>

