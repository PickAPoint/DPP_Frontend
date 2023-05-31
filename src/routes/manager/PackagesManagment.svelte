<script>
    import { Badge, Table, TableHead, TableHeadCell, TableBody, TableBodyCell, TableBodyRow } from "flowbite-svelte";
    import { Dates } from '$lib/utils/Dates';

    export let packages= [];

    const states = {
      'OrderPlaced': ['purple', 'Order Placed'],
      'InTransit': ['yellow', 'In Transit'],
      'Delivered': ['pink', 'Delivered'],
      'Cancelled': ['red', 'Cancelled'],
      'Collected': ['green', 'Collected']
    }

    function getMultipleRandom(arr, num) {
        const shuffled = [...arr].sort(() => 0.5 - Math.random());

        return shuffled.slice(0, num);
    }


</script>

<div class="mb-16">
    <a id="admin_packages" href="/manager/packages" class="text-sm font-medium text-primary-900 hover:underline">
    <p class="text-2xl font-light">Packages</p>
    </a>

    <div class="my-3 w-full">
      {#if packages.length === 0}
          <div class="flex justify-center items-center">
              <p class="text-gray-500 dark:text-gray-400">No PickUp Point Packages found. Either the database is down or there are still no packages </p>
          </div>
      {:else}
      <Table shadow>
        <TableHead class="bg-primary-200">
          <TableHeadCell>Package ID</TableHeadCell>
          <TableHeadCell>Last Update</TableHeadCell>
          <TableHeadCell>Last Update Time</TableHeadCell>
          <TableHeadCell>Client</TableHeadCell>
          <TableHeadCell>Current State</TableHeadCell>
        </TableHead>
          <TableBody class="divide-y">
            {#each getMultipleRandom(packages, 5) as pack}
              <TableBodyRow>
                <TableBodyCell>
                  <a href={"manager/packages/" + pack.id} class="underline">{pack.id}</a>
                </TableBodyCell>
    
                <TableBodyCell>
                  {Dates.getFormattedDateTime(pack.states[pack.states.length - 1].orderDate).split(" ")[0]}
                </TableBodyCell>
                
                <TableBodyCell>
                  {Dates.getFormattedDateTime(pack.states[pack.states.length - 1].orderDate).split(" ")[1]}
                </TableBodyCell>
    
                <TableBodyCell>
                  {pack.client.fname + " " + pack.client.lname}
                </TableBodyCell>
                
                <TableBodyCell>
                  <Badge color={states[pack.orderState][0]}>{states[pack.orderState][1]}</Badge>
                </TableBodyCell>
              </TableBodyRow>
            {/each}
            </TableBody>
        </Table>
      {/if}
    </div>
</div>