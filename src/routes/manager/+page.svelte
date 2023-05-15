<script>
    import { Button, Table, TableBody, TableHead, TableBodyRow, TableBodyCell, TableHeadCell } from 'flowbite-svelte';
    import UsersList from './UsersList.svelte';
    import PackagesManagment from './PackagesManagment.svelte';
    
    import "@carbon/styles/css/styles.css";
    import "@carbon/charts/styles.css";

    import UserStats from './UserStats.svelte';


    let admin = {
        name: "Bill Gates",
        email: "admin@ua.pt",
    }

    let users = [
        { id: 1, name: 'Fnac Aveiro', email: 'fnac@ua.ptAveiro', address: 'Fórum Aveiro, R. do Batalhão de Caçadores 10, 3810-064 Aveiro' },
        { id: 2, name: 'McDonalds Aveiro', email: 'mc@ua.pt', address: 'R. Das Pombas, Aveiro, Aveiro 3810-150'},
        { id: 3, name: 'Burger King Aveiro', email: 'bk@ua.pt', address: 'Burger King - Verdemilho, Ic 1 216, 3810-193'},
        { id: 4, name: 'Pingo Doce Aveiro', email: 'pingodoce@ua.pt', address: 'R. do Batalhão de Caçadores 10, 3810-064 Aveiro'},
    ];

    let packages = [
        { id: "AC123TD5oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo", arrival_date: "10/05/2023", arrival_time: "14:45:00", courier: "John Paul", time_stored: 2 },
        { id: "AUICVS21", arrival_date: "09/02/2022", arrival_time: "12:13:02", courier: "João Maromba", time_stored: 3 },
        { id: "AFWAS21J", arrival_date: "02/02/2022", arrival_time: "08:22:32", courier: "Vin Diesel", time_stored: 5},
        { id: "FAWASFS2", arrival_date: "05/07/2021", arrival_time: "09:32:55", courier: "Marco Orácio", time_stored: 1},
        { id: "FASAD21S", arrival_date: "06/12/2022", arrival_time: "08:32:12", courier: "António Costa", time_stored: 0},
        { id: "CVGHNJ2S", arrival_date: "03/11/2022", arrival_time: "09:42:22", courier: "Cristiano Ronaldo", time_stored: 5},
        { id: "213SACX2", arrival_date: "02/10/2022", arrival_time: "10:52:32", courier: "Cristina Ferreira", time_stored: 8},
    ]
    
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