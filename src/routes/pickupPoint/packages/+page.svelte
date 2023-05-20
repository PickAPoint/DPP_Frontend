<script>
    import { page } from '$app/stores'
    import { onMount } from "svelte";
    import { goto } from '$app/navigation';
    import { session } from '$lib/session';
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge, Button, Dropdown, DropdownItem, Chevron, DropdownDivider } from 'flowbite-svelte';
    import Icon from 'svelte-icons-pack/Icon.svelte';
    import RiSystemFilterFill from "svelte-icons-pack/ri/RiSystemFilterFill";

    let filterQueryParam = $page.url.searchParams.get('filter');
    let filter = filterQueryParam ? filterQueryParam : "";
    let filterOpen = false;


    onMount(async () => {
    if ($session.id === undefined) {
      goto('/login');
      return;
    }

    //api call to get packages
    })


    const states = {
        'OrderPlaced': ['purple', 'Order Placed'],
        'InTransit': ['yellow', 'In Transit'],
        'Delivered': ['pink', 'Delivered'],
        'Cancelled': ['red', 'Cancelled'],
        'Collected': ['green', 'Collected']
    }


    const statesPickupPoint = {
        'stored': ['Delivered'],
        'canceled': ['Cancelled'],
        'expected': ['OrderPlaced', 'InTransit']
    }

    
    const packages = [
        {
            id: 'AC123TD5',
            clientName: 'John',
            clientSurname: 'Paul',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'OrderPlaced'
        },
        {
            id: 'AC1SDFD5',
            clientName: 'Mary',
            clientSurname: 'Popins',
            lastUpdate: '10/05/2023 23:45:00',
            status: 'InTransit'
        },
        {
            id: '12123FD5',
            clientName: 'Michael',
            clientSurname: 'Jackson',
            lastUpdate: '10/05/2023 12:03:33',
            status: 'Collected'
        },
        {
            id: 'A4309TD5',
            clientName: 'Ed',
            clientSurname: 'Sheeran',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'Cancelled'
        },
        {
            id: '76GSDFD5',
            clientName: 'Mary',
            clientSurname: 'Lawrance',
            lastUpdate: '12/09/2023 23:45:00',
            status: 'Delivered'
        },
        {
            id: 'AC343TD5',
            clientName: 'Trevis',
            clientSurname: 'Scott',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'Collected'
        },
        {
            id: 'AC1S09D5',
            clientName: 'Beyonce',
            clientSurname: 'Mills',
            lastUpdate: '10/05/2023 23:45:00',
            status: 'InTransit'
        },
        {
            id: 'A4343TD5',
            clientName: 'Trevis',
            clientSurname: 'Scott',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'Cancelled'
        },
        {
            id: '76GS26D5',
            clientName: 'Will',
            clientSurname: 'Smith',
            lastUpdate: '12/09/2023 23:45:00',
            status: 'Collected'
        }

    ]

    function handleFilter(f) {
        filter = f;
        filterOpen = false;
    }


</script>


<div class="container my-12">

    <div class="flex justify-between">
        <div>
            <p class="text-4xl font-bold inline-block mb-1">Packages</p>
        </div>

        <div>
            <Button color="primary" size="sm">
                Filter
                <Icon src={RiSystemFilterFill} color="#fff1ee" className="ml-2" />
            </Button>
            <Dropdown bind:open={filterOpen}>
                <DropdownItem on:click={() => {handleFilter('')}}>All</DropdownItem>
                <DropdownDivider/>
                <DropdownItem on:click={() => {handleFilter('stored')}}>Stored</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('expected')}}>Expected</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('forgotten')}}>Forgotten</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('canceled')}}>Canceled</DropdownItem>
            </Dropdown>
        </div>
    </div>


    <div class="my-3">
        <Table shadow>
            <TableHead class="bg-primary-200">
                <TableHeadCell>Package ID</TableHeadCell>
                <TableHeadCell>Client Name</TableHeadCell>
                <TableHeadCell>Client  Surname</TableHeadCell>
                <TableHeadCell>Last Update</TableHeadCell>
                <TableHeadCell>Status</TableHeadCell>
            </TableHead>
            
            <TableBody class="divide-y">
                {#each packages as p}
                    {#if filter == "" || statesPickupPoint[filter].includes(p.status)}
                        <TableBodyRow>
                            <TableBodyCell>
                                <a href={"./packages/" + p.id} class="underline">{p.id}</a>
                            </TableBodyCell>

                            <TableBodyCell>
                                {p.clientName}
                            </TableBodyCell>

                            <TableBodyCell>
                                {p.clientSurname}
                            </TableBodyCell>

                            <TableBodyCell>
                                {p.lastUpdate}
                            </TableBodyCell>

                            <TableBodyCell>
                                <Badge color={states[p.status][0]}>{states[p.status][1]}</Badge>
                            </TableBodyCell>
                        </TableBodyRow>
                    {/if}
                {/each}
            </TableBody>
        </Table>
    </div>
</div>
