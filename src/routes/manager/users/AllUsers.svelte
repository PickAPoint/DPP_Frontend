<script>
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, TableSearch, Button } from 'flowbite-svelte';
  
  import Icon from 'svelte-icons-pack/Icon.svelte';
  // import FaSolidTrashAlt from "svelte-icons-pack/fa/FaSolidTrash";
  import FaTrashAlt from 'svelte-icons/fa/FaTrashAlt.svelte'


  let searchTerm = '';
  let items = [
    { id: 1, name: 'Fnac Aveiro', email: 'fnac@ua.ptAveiro', address: 'Fórum Aveiro, R. do Batalhão de Caçadores 10, 3810-064 Aveiro' },
    { id: 2, name: 'McDonalds Aveiro', email: 'mc@ua.pt', address: 'R. Das Pombas, Aveiro, Aveiro 3810-150'},
    { id: 3, name: 'Burger King Aveiro', email: 'bk@ua.pt', address: 'Burger King - Verdemilho, Ic 1 216, 3810-193'},
    { id: 4, name: 'Pingo Doce Aveiro', email: 'pingodoce@ua.pt', address: 'R. do Batalhão de Caçadores 10, 3810-064 Aveiro'},
  ];
  $: filteredItems = items.filter(
    (item) => item.name.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1
  );

</script>

<div class="h-[40vh] overflow-y-auto">
  <TableSearch striped={true} placeholder="Search by Pick Up Point name" hoverable={true} bind:inputValue={searchTerm}>
      <TableHead>
        <TableHeadCell class="font-bold">Name</TableHeadCell>
        <TableHeadCell class="font-bold">Email</TableHeadCell>
        <TableHeadCell class="w-[100%] font-bold">Address</TableHeadCell>
        <TableHeadCell class="flex justify-center font-bold">Manage</TableHeadCell>
      </TableHead>
      <TableBody class="divide-y">
        {#each filteredItems as item}
          <TableBodyRow>
            <TableBodyCell class="w-52">
            <div class="w-52 truncate">
              {item.name}
            </div>
            </TableBodyCell>
            <TableBodyCell class="w-60">
              <div class="w-60 truncate">
                {item.email}
              </div>
            </TableBodyCell>
            <TableBodyCell>
              <div class="w-[70vh] truncate">
                {item.address}
              </div>
            </TableBodyCell>
            <TableBodyCell class="w-10">
              <!-- Center div elements -->
              <div class="flex justify-center">
                <a href="/manager/users" class="w-4 cursor-pointer text-red-500 hover:text-red-900">
                  <FaTrashAlt />
                </a>
              </div>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
  </TableSearch>
</div>