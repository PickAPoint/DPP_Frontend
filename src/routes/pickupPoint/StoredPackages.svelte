<script>
    import { Dates } from '$lib/utils/Dates';
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge } from 'flowbite-svelte';
    import BsPlusCircle from "svelte-icons-pack/bs/BsPlusCircle";
    import Icon from 'svelte-icons-pack/Icon.svelte';

    export let storedPackages = [];
</script>

<div class="my-3">
    <Table shadow>
        <TableHead class="bg-primary-200">
            <TableHeadCell>Package ID</TableHeadCell>
            <TableHeadCell>Arrival Date</TableHeadCell>
            <TableHeadCell>Arrival Time</TableHeadCell>
            <TableHeadCell>Client</TableHeadCell>
            <TableHeadCell>Time Stored</TableHeadCell>
        </TableHead>
        <TableBody class="divide-y">
    
            {#each storedPackages as p}
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
                {Dates.getDaysBetweenDates(new Date(p.states[p.states.length - 1].orderDate), new Date())} days
                </TableBodyCell>
            </TableBodyRow>
            {/each}
    
        </TableBody>
    </Table>
    
    <div class="flex justify-center items-center mt-3">
        <div>
            <a href="/pickupPoint/packages?filter=stored"><Icon src={ BsPlusCircle} color="#fe795d" className="w-6 h-6 mr-3" /></a>
        </div>
        <div>
            <a href="/pickupPoint/packages?filter=stored" class="text-primary-500">See all stored packages</a>
        </div>
    </div>
</div>
