<script>
    import { page } from '$app/stores'
    import { TableSearch, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge, Button, Dropdown, DropdownItem, DropdownDivider } from 'flowbite-svelte';
    import Icon from 'svelte-icons-pack/Icon.svelte';
    import RiSystemFilterFill from "svelte-icons-pack/ri/RiSystemFilterFill";
    import RiSystemArrowDropDownLine from "svelte-icons-pack/ri/RiSystemArrowDropDownLine";
    import { ApiAdmin } from '$lib/api/ApiAdmin.js';
    import { Dates } from '$lib/utils/Dates';

    let filterQueryParam = $page.url.searchParams.get('filter');
    let filter = filterQueryParam ? filterQueryParam : "";
    let filterOpen = false;

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
        'expected': ['OrderPlaced', 'InTransit'],
        'completed': ['Collected'],
    }

    export let packages = [];

    
    // Change current filter and close dropdown
    function handleFilter(f) {
        filter = f;
        filterOpen = false;
    }

    // Create a status dropdown for each package
    const filterOf = packages.map((item) => {
        return {
            [item.id]: false
        }
    })

    // Hangle change status of a package
    function handleChangeStatus(item, status) {
        if (item.orderState == status) {
            console.log("Package already in this status");
            filterOf[item.id] = false;
            return;
        }

        ApiAdmin.adminUpdatePackage(item, status)
            .then(data => {
                if (data === false) {
                    alert("Error updating package status")
                    filterOf[item.id] = false;
                    return;
                }
                // Update item status in packages array
                packages = packages.map((p) => {
                    if (p.id == item.id) {
                        p.orderState = status;
                    }
                    return p;
                })
            })
            .catch(err => {
                console.log("Error", err);
            })

        filterOf[item.id] = false;
    }

    // Filter items by search term, id in this case
    let searchTerm = '';
    $: filteredItems = packages.filter(
        (item) => item.client.id.toString().toLowerCase().indexOf(searchTerm.toLowerCase()) !== -1
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
                    <DropdownItem on:click={() => {handleFilter('canceled')}}>Canceled</DropdownItem>
                    <DropdownItem on:click={() => {handleFilter('expected')}}>Expected</DropdownItem>
                    <DropdownItem on:click={() => {handleFilter('completed')}}>Completed</DropdownItem>
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
                    <TableBody>
                    {#each filteredItems as item}
                        {#if filter == "" || statesPickupPoint[filter].includes(item.orderState) }
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
                                        {item.client.fname + " " + item.client.lname}
                                    </div>
                                </TableBodyCell>
                                <TableBodyCell>
                                    <div class="truncate">
                                        {Dates.getFormattedDateTime(item.states[item.states.length - 1].orderDate)}
                                    </div>
                                </TableBodyCell>
                                <TableBodyCell>
                                    <Badge color={states[item.orderState][0]}>{states[item.orderState][1]}<Icon src={RiSystemArrowDropDownLine} color="#fff1ee" className="ml-2" /> </Badge>
                                    <Dropdown bind:open={filterOf[item.id]}>
                                        <DropdownItem on:click={() => {handleChangeStatus(item, 'OrderPlaced')}}>Order Placed</DropdownItem>
                                        <DropdownItem on:click={() => {handleChangeStatus(item, 'InTransit')}}>In Transit</DropdownItem>
                                        <DropdownItem on:click={() => {handleChangeStatus(item, 'Delivered')}}>Delivered</DropdownItem>
                                        <DropdownItem on:click={() => {handleChangeStatus(item, 'Cancelled')}}>Cancelled</DropdownItem>
                                        <DropdownItem on:click={() => {handleChangeStatus(item, 'Collected')}}>Collected</DropdownItem>
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