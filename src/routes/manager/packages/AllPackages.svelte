<script>
    import { page } from '$app/stores'
    import { TableSearch, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge, Button, Dropdown, DropdownItem, DropdownDivider } from 'flowbite-svelte';
    import Icon from 'svelte-icons-pack/Icon.svelte';
    import RiSystemFilterFill from "svelte-icons-pack/ri/RiSystemFilterFill";
    import RiSystemArrowDropDownLine from "svelte-icons-pack/ri/RiSystemArrowDropDownLine";

    let filterQueryParam = $page.url.searchParams.get('filter');
    let filter = filterQueryParam ? filterQueryParam : "";
    let filterOpen = false;

    const states = {
        'order_placed': ['purple', 'Order Placed'],
        'processing': ['blue', 'Processing'],
        'in_transit': ['yellow', 'In Transit'],
        'delivered': ['pink', 'Delivered'],
        'cancelled': ['red', 'Cancelled'],
        'collected': ['green', 'Collected']
    }

    const statesPickupPoint = {
        'stored': ['delivered'],
        'canceled': ['cancelled'],
        'expected': ['order_placed', 'processing', 'in_transit'],
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

    const filterOf = packages.map((item) => {
        return {
            [item.id]: false
        }
    })

    function handleFilter(f) {
        filter = f;
        filterOpen = false;
    }

    function handleChangeStatus(id, status) {
        console.log("Changing status of package: ", id, "to", status);
        filterOf[id] = false;
    }


    let searchTerm = '';
    $: filteredItems = packages.filter(
        (item) => item.id.toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1
    );


</script>


<div>
    {#if packages.length === 0}
        <div class="h-12"></div>
        <div class="flex justify-center items-center">
            <p class="text-gray-500 dark:text-gray-400">No PickUp Point Packages found. Either the database is down or there are still no packages </p>
        </div>
    {:else}
        <div>
            <div class="flex justify-end">
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
            <div>
                <TableSearch striped={true} placeholder="Search by Pick Up Point name" hoverable={true} bind:inputValue={searchTerm}>
                    <TableHead>
                    <TableHeadCell class="font-bold">Package ID</TableHeadCell>
                    <TableHeadCell class="font-bold">Client Name</TableHeadCell>
                    <TableHeadCell class="font-bold">Last Update</TableHeadCell>
                    <TableHeadCell class="font-bold">Package Status</TableHeadCell>
                    </TableHead>
                    <TableBody class="divide-y">
                    {#each filteredItems as item}
                        {#if filter == "" || statesPickupPoint[filter].includes(item.status) }
                            <TableBodyRow>
                                <TableBodyCell>
                                    <div class="truncate">
                                        <a href="/manager/packages/{item.id}">
                                            {item.id}
                                        </a>
                                    </div>
                                </TableBodyCell>
                                <TableBodyCell>
                                    <div class="truncate">
                                        {item.clientName + " " + item.clientSurname}
                                    </div>
                                </TableBodyCell>
                                <TableBodyCell>
                                    <div class="truncate">
                                        {item.lastUpdate}
                                    </div>
                                </TableBodyCell>
                                <TableBodyCell>
                                    <Badge color={states[item.status][0]}>{states[item.status][1]}<Icon src={RiSystemArrowDropDownLine} color="#fff1ee" className="ml-2" /> </Badge>
                                    <Dropdown bind:open={filterOf[item.id]}>
                                        <DropdownItem on:click={() => {handleChangeStatus(item.id, '')}}>All</DropdownItem>
                                        <DropdownDivider/>
                                        <DropdownItem on:click={() => {handleChangeStatus(item.id, 'stored')}}>Stored</DropdownItem>
                                        <DropdownItem on:click={() => {handleChangeStatus(item.id, 'expected')}}>Expected</DropdownItem>
                                        <DropdownItem on:click={() => {handleChangeStatus(item.id, 'forgotten')}}>Forgotten</DropdownItem>
                                        <DropdownItem on:click={() => {handleChangeStatus(item.id, 'canceled')}}>Canceled</DropdownItem>
                                    </Dropdown>



                                </TableBodyCell>
                            </TableBodyRow>
                        {/if}
                    {/each}
                    </TableBody>
                </TableSearch>
            </div>
        </div>
    {/if}
</div>