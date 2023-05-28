<script>
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, TableSearch, Button } from 'flowbite-svelte';
  import { ApiAdmin } from '$lib/api/ApiAdmin';
  
  import Icon from 'svelte-icons-pack/Icon.svelte';
  // import FaSolidTrashAlt from "svelte-icons-pack/fa/FaSolidTrash";
  import FaTrashAlt from 'svelte-icons/fa/FaTrashAlt.svelte'


  let searchTerm = '';
  export let items = [];

  $: filteredItems = items.filter(
    (item) => item.name.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1
  );

  const handleDelete = (id) => {
    ApiAdmin.adminDeleteUser(id)
        .then(data => {
            if (data == false) {
              alert("Error deleting user");
            }
            else{
              // Pop user from users list and add it to items list
              items = items.filter(item => item.id != id);
            }
        })
        .catch(err => {
            console.log(err);
        })
  }

</script>

<div>
  {#if items.length === 0}
    <div class="col-span-3">
      <div class="flex flex-col items-center justify-center h-full space-y-2">
        <h3 class="text-2xl font-medium text-gray-900 dark:text-white">No Registered PickUpPoints Found</h3>
        <p class="text-gray-500 dark:text-gray-400">If you should see data here and the problem persists, contact the admin.</p>
      </div>
    </div>
  {:else}
    <div class="h-[minmax(0vh_40vh)] overflow-y-auto">
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
                    <button on:click={handleDelete(item.id)} class="w-4 cursor-pointer text-red-500 hover:text-red-900">
                      <FaTrashAlt />
                    </button>
                  </div>
                </TableBodyCell>
              </TableBodyRow>
            {/each}
          </TableBody>
      </TableSearch>
    </div>
  {/if}
</div>