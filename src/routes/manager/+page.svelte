<script>
    import UsersList from './UsersList.svelte';
    import PackagesManagment from './PackagesManagment.svelte';
    import { ApiAdmin } from '$lib/api/ApiAdmin.js';
    import { session } from '$lib/session';
    import { onMount } from "svelte";
    import { goto } from '$app/navigation';


    onMount(async () => {
        if ($session.id === undefined || $session.type != "Admin") {
        goto('/login');
        return;
        }

        ApiAdmin.adminDashboard()
            .then(data => {
                users = data.data1.filter(user => user.type == "Partner");
                packages = data.data2;
            })
            .catch(err => {
                console.log("Error", err);
            })
    })

    let admin = {
        name: $session.name,
    }

    let users = [];
    let packages = [];

    
    
</script>


<div class="container my-12">


    <div>
        <p class="text-4xl font-bold inline-block">Administrator</p>        
        <!-- <div class="mt-4 mb-11">
            <Button color="primary" on:click={() => true}>Manage Users</Button>
        </div> -->
    </div>

    <div class="h-12"></div>
    
    <div>
        <UsersList users_list={users}/>
    </div>

    <div class="h-12"></div>
    
    <div>
        <PackagesManagment packages={packages}/>
    </div>



</div>