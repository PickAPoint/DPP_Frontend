<script>
    import { Dates } from '$lib/utils/Dates';
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge } from 'flowbite-svelte';
    import BsPlusCircle from "svelte-icons-pack/bs/BsPlusCircle";
    import Icon from 'svelte-icons-pack/Icon.svelte';

    export let expectedPackages = [];

    const states = {
      'OrderPlaced': ['purple', 'Order Placed'],
      'InTransit': ['yellow', 'In Transit'],
      'Delivered': ['pink', 'Delivered'],
      'Cancelled': ['red', 'Cancelled'],
      'Collected': ['green', 'Collected']
    }
    
</script>


<div class="my-3">
    <Table shadow>
      <TableHead class="bg-primary-200">
        <TableHeadCell>Package ID</TableHeadCell>
        <TableHeadCell>Last Update</TableHeadCell>
        <TableHeadCell>Last Update Time</TableHeadCell>
        <TableHeadCell>Client</TableHeadCell>
        <TableHeadCell>Current State</TableHeadCell>
      </TableHead>
      <TableBody class="divide-y">
        
        {#each expectedPackages as p}
          <TableBodyRow>
            <TableBodyCell>
              <a href={"pickupPoint/packages/" + p.id} class="underline">{p.id}</a>
            </TableBodyCell>

            <TableBodyCell>
              {Dates.getFormattedDateTime(p.states[p.states.length - 1].orderDate).split(" ")[0]}
            </TableBodyCell>
            
            <TableBodyCell>
              {Dates.getFormattedDateTime(p.states[p.states.length - 1].orderDate).split(" ")[1]}
            </TableBodyCell>

            <TableBodyCell>
              {p.client.fname + " " + p.client.lname}
            </TableBodyCell>
            
            <TableBodyCell>
              <Badge color={states[p.orderState][0]}>{states[p.orderState][1]}</Badge>
            </TableBodyCell>
          </TableBodyRow>
        {/each}

      </TableBody>
    </Table>

    <div class="text-right mt-1">
        <a href="/pickupPoint/packages?filter=expected" class="text-primary-500 text-sm">See all expected packages</a>
    </div>
</div>