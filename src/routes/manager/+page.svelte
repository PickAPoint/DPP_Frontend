<script>
    import { Button, Table, TableBody, TableHead, TableBodyRow, TableBodyCell, TableHeadCell } from 'flowbite-svelte';
    import UsersList from './UsersList.svelte';
    // import UserStats from './UserStats.svelte';

    // import UserStats from './UserStats.svelte';
    
    import "@carbon/styles/css/styles.css";
    import "@carbon/charts/styles.css";


    let admin = {
        name: "Bill Gates",
        email: "admin@ua.pt",
    }

    let users_list = [
      { img:  "F",
        name: "Fnac Aveiro", email: "fnac@aveiro.com", address:"Fórum Aveiro, R. do Batalhão de Caçadores 10, 3810-064 Aveiro"
      },
      { img:  "M",
        name: "McDonald's Aveiro", email: "mcdonalds@aveiro.com", address:"R. das Pombas, 3810-150 Aveiro"
      },
    ];
    
</script>


<div class="container my-12">


    <div>
        <p class="text-4xl font-bold inline-block">{admin.name}</p>
        <span class="font-extralight italic mx-1 text-lg">Administrator</span>
        
        <!-- <div class="mt-4 mb-11">
            <Button color="primary" on:click={() => true}>Manage Users</Button>
        </div> -->
    </div>

    <div class="h-12">
    </div>
    
    
    <div>
        <UsersList users_list={users_list}/>
    </div>


</div>