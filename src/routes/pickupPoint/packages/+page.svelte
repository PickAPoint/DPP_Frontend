<script>
    import { page } from '$app/stores'
    import { onMount } from "svelte";
    import { goto } from '$app/navigation';
    import { fly } from 'svelte/transition';
    import { session } from '$lib/session';
    import { ApiPickupPoint } from '$lib/api/ApiPickupPoint';
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge, Button, Dropdown, DropdownItem, Skeleton, DropdownDivider } from 'flowbite-svelte';
    import Icon from 'svelte-icons-pack/Icon.svelte';
    import RiSystemFilterFill from "svelte-icons-pack/ri/RiSystemFilterFill";

    let filterQueryParam = $page.url.searchParams.get('filter');
    let filter = filterQueryParam ? filterQueryParam : "";
    let loading = true;
    let filterOpen = false;
    let packages = [];


    onMount(async () => {
        if ($session.id === undefined) {
        goto('/login');
        return;
        }

        //api call to get packages
        ApiPickupPoint.getPackages($session.id)
        .then(res => {
            packages = res;
            loading = false;
        })
        .catch(err => {
            console.log(err);
        })
    });


    const states = {
        'OrderPlaced': ['purple', 'Order Placed'],
        'InTransit': ['yellow', 'In Transit'],
        'Delivered': ['pink', 'Delivered'],
        'Cancelled': ['red', 'Cancelled'],
        'Collected': ['green', 'Collected'],
    }

    const statesPickupPoint = {
        'stored': ['Delivered'],
        'cancelled': ['Cancelled'],
        'expected': ['OrderPlaced', 'InTransit'],
        'collected': ['Collected'],
    }

    function handleFilter(f) {
        filter = f;
        filterOpen = false;
    }


</script>


{#if loading}

  <div class="container my-12">
    <Skeleton size="sm" class="my-8" />
    <Skeleton size="md" class="my-8" />
    <Skeleton size="lg" class="my-8" />
    <Skeleton size="xl" class="my-8" />
  </div>

{:else}
    <div
        in:fly={{y: 100, duration: 300, opacity:0}}
        class="container my-12">

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
                    <DropdownItem on:click={() => {handleFilter('canceled')}}>Canceled</DropdownItem>
                    <DropdownItem on:click={() => {handleFilter('collected')}}>Collected</DropdownItem>
                </Dropdown>
            </div>
        </div>


        <div class="my-3">
            <Table shadow>
                <TableHead class="bg-primary-200">
                    <TableHeadCell>Package ID</TableHeadCell>
                    <TableHeadCell>Client</TableHeadCell>
                    <TableHeadCell>Last Update</TableHeadCell>
                    <TableHeadCell>Current State</TableHeadCell>
                </TableHead>
                
                <TableBody class="divide-y">
                    
                    {#each packages as p}
                        {#if filter == "" || statesPickupPoint[filter].includes(p.orderState)}
                            <TableBodyRow>
                                <TableBodyCell>
                                    <a href={"./packages/" + p.id} class="underline">{p.id}</a>
                                </TableBodyCell>

                                <TableBodyCell>
                                    {p.client.fname + " " + p.client.lname}
                                </TableBodyCell>

                                <TableBodyCell>
                                    {p.states[p.states.length - 1].orderDate.split("T")[0] + " " + p.states[p.states.length - 1].orderDate.split("T")[1].split(".")[0]}
                                </TableBodyCell>

                                <TableBodyCell>
                                    <Badge color={states[p.orderState][0]}>{states[p.orderState][1]}</Badge>
                                </TableBodyCell>
                            </TableBodyRow>
                        {/if}
                    {/each}
                    
                </TableBody>
            </Table>
        </div>
    </div>
{/if}

