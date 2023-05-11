<script>
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge, Button, Dropdown, DropdownItem, Chevron } from 'flowbite-svelte';
    import Icon from 'svelte-icons-pack/Icon.svelte';
    import RiSystemFilterFill from "svelte-icons-pack/ri/RiSystemFilterFill";
	import { bind } from 'svelte/internal';

    let filter = "";
    let filterOpen = false;

    const badges = {
        'order_placed': ['purple', 'Order Placed'],
        'processing': ['blue', 'Processing'],
        'in_transit': ['yellow', 'In Transit'],
        'delivered': ['pink', 'Delivered'],
        'cancelled': ['red', 'Cancelled'],
        'collected': ['green', 'Collected']
    }

    const packages = [
        {
            id: 'AC123TD5',
            clientName: 'John',
            clientSurname: 'Paul',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'order_placed'
        },
        {
            id: 'AC1SDFD5',
            clientName: 'Mary',
            clientSurname: 'Popins',
            lastUpdate: '10/05/2023 23:45:00',
            status: 'in_transit'
        },
        {
            id: '121SDFD5',
            clientName: 'Michael',
            clientSurname: 'Jackson',
            lastUpdate: '10/05/2023 12:03:33',
            status: 'processing'
        },
        {
            id: '12123FD5',
            clientName: 'Michael',
            clientSurname: 'Jackson',
            lastUpdate: '10/05/2023 12:03:33',
            status: 'collected'
        },
        {
            id: 'A4309TD5',
            clientName: 'Ed',
            clientSurname: 'Sheeran',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'cancelled'
        },
        {
            id: '76GSDFD5',
            clientName: 'Mary',
            clientSurname: 'Lawrance',
            lastUpdate: '12/09/2023 23:45:00',
            status: 'delivered'
        },
        {
            id: 'AC343TD5',
            clientName: 'Trevis',
            clientSurname: 'Scott',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'collected'
        },
        {
            id: 'AC1S09D5',
            clientName: 'Beyonce',
            clientSurname: 'Mills',
            lastUpdate: '10/05/2023 23:45:00',
            status: 'in_transit'
        },
        {
            id: 'A4343TD5',
            clientName: 'Trevis',
            clientSurname: 'Scott',
            lastUpdate: '10/05/2023 14:45:00',
            status: 'cancelled'
        },
        {
            id: '121SDJD5',
            clientName: 'Bruno',
            clientSurname: 'Mars',
            lastUpdate: '10/05/2023 12:03:33',
            status: 'processing'
        },
        {
            id: '76GS26D5',
            clientName: 'Will',
            clientSurname: 'Smith',
            lastUpdate: '12/09/2023 23:45:00',
            status: 'collected'
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
                <DropdownItem on:click={() => {handleFilter('order_placed')}}>Order Placed</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('processing')}}>Processing</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('in_transit')}}>In Transit</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('delivered')}}>Delivered</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('cancelled')}}>Cancelled</DropdownItem>
                <DropdownItem on:click={() => {handleFilter('collected')}}>Collected</DropdownItem>
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
                    {#if filter == "" || filter == p.status}
                        <TableBodyRow>
                            <TableBodyCell>
                                <a href={"./packages/" + p.id} class="">{p.id}</a>
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
                                <Badge color={badges[p.status][0]}>{badges[p.status][1]}</Badge>
                            </TableBodyCell>
                        </TableBodyRow>
                    {/if}
                {/each}
            </TableBody>
        </Table>
    </div>
</div>
