<script>
    import { Button, Table, TableBody, TableHead, TableBodyRow, TableBodyCell, TableHeadCell } from 'flowbite-svelte';
    import UsersList from './UsersList.svelte';
    import PackagesManagment from './PackagesManagment.svelte';
    import { ApiAdmin } from '$lib/api/ApiAdmin.js';
    
    import "@carbon/styles/css/styles.css";
    import "@carbon/charts/styles.css";

    import UserStats from './UserStats.svelte';

    // O admin vem de trás através do login

    let admin = {
        name: "Bill Gates",
        email: "admin@ua.pt",
    }

    let users = [];
    let packages = [];

    ApiAdmin.adminDashboard()
        .then(data => {
            users = data.data1.filter(user => user.type == "Partner");
            packages = data.data2;
        })
        .catch(err => {
            console.log("Error", err);
        })
    
</script>


<div class="container my-12">


    <div>
        <p class="text-4xl font-bold inline-block">{admin.name}</p>
        <span class="font-extralight italic mx-1 text-lg">Administrator</span>
        
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