<script>
  import Stats from "./Stats.svelte";
  import { onMount } from "svelte";
  import { fly } from 'svelte/transition';
  import { goto } from '$app/navigation';
  import { session } from '$lib/session';
  import { ApiPickupPoint } from '$lib/api/ApiPickupPoint';
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Button, Modal, Input, Label, Badge, Skeleton } from 'flowbite-svelte';
  import BsPlusCircle from "svelte-icons-pack/bs/BsPlusCircle";
  import Icon from 'svelte-icons-pack/Icon.svelte';


  let loading = true;
  let packageId = "";
  let packages = [];
  let filteredPackages = {}

  const states = {
    'OrderPlaced': ['purple', 'Order Placed'],
    'InTransit': ['yellow', 'In Transit'],
    'Delivered': ['pink', 'Delivered'],
    'Cancelled': ['red', 'Cancelled'],
    'Collected': ['green', 'Collected']
  }

  let registerPackageModal = false;
  let registerPackageConsentModal = false;
  let registerPickUpModal = false;
  let registerPickUpConsentModal = false;


  onMount(async () => {
    if ($session.id === undefined) {
      goto('/login');
      return;
    }

    //api call to get packages
    ApiPickupPoint.getPackages($session.id)
      .then(res => {
        packages = res;
        filteredPackages = filterPackages();
        loading = false;
      })
      .catch(err => {
        console.log(err);
      })
  })


  function getDaysBetweenDates(firstDate, secondDate) {
    const oneDay = 24 * 60 * 60 * 1000;
    const timeDifference = Math.abs(firstDate - secondDate);
    const numberOfDays = Math.round(timeDifference / oneDay);
    return numberOfDays;
  }


  function filterPackages() {

    let packagesFiltered = {
      'expected': [],
      'stored': [],
      'cancelled': [],
      'collected': []
    }

    packages.forEach((p) => {
      if (p.orderState === 'Delivered') {
        packagesFiltered.stored.push(p);
      }
      else if (p.orderState === 'Cancelled') {
        packagesFiltered.cancelled.push(p);
      }
      else if (p.orderState === 'OrderPlaced' || p.orderState === 'InTransit') {
        packagesFiltered.expected.push(p);
      }
      else if (p.orderState === 'Collected') {
        packagesFiltered.collected.push(p);
      }
    })

    return packagesFiltered;
  }


  function registerPackage() {
    console.log('Register package: ' + packageId);
    registerPackageModal = false;
    packageId = "";
  }


  function registerPickUp() {
    console.log('Register pick up: ' + packageId);
    registerPickUpModal = false;
    packageId = "";
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

      <div>
          <p class="text-4xl font-bold inline-block">{$session.name}</p>
          <span class="font-extralight italic mx-1 text-lg">Pick-up Point</span>
          
          <div class="mt-4 mb-11">
              <Button color="primary" on:click={() => registerPackageModal = true}>Register Package</Button>
              <Button color="primary" on:click={() => registerPickUpModal = true}>Register Pick Up</Button>
          </div>
      </div>


      <Stats packages={filteredPackages} />


      <div class="mb-16">
          <p class="text-2xl font-light">Stored Packages</p>

          <div class="my-3">
              {#if filteredPackages['stored'].length === 0}
                <p class="font-light text-center dark:text-gray-600 text-gray-400">No stored packages</p>
              {:else}
                <Table shadow>
                    <TableHead class="bg-primary-200">
                      <TableHeadCell>Package ID</TableHeadCell>
                      <TableHeadCell>Arrival Date</TableHeadCell>
                      <TableHeadCell>Arrival Time</TableHeadCell>
                      <TableHeadCell>Client</TableHeadCell>
                      <TableHeadCell>Time Stored</TableHeadCell>
                    </TableHead>
                    <TableBody class="divide-y">

                      {#each filteredPackages['stored'] as p}
                        <TableBodyRow>
                          <TableBodyCell>
                            <a href={"pickupPoint/packages/" + p.id} class="underline">{p.id}</a>
                          </TableBodyCell>
                          <TableBodyCell>{p.states[p.states.length - 1].orderDate.split("T")[0]}</TableBodyCell>
                          <TableBodyCell>{p.states[p.states.length - 1].orderDate.split("T")[1].split(".")[0]}</TableBodyCell>
                          <TableBodyCell>{p.client.fname + " " + p.client.lname}</TableBodyCell>
                          <TableBodyCell>{getDaysBetweenDates(new Date(p.states[p.states.length - 1].orderDate), new Date())} days</TableBodyCell>
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
              {/if}
          </div>
      </div>

      <div class="mb-16">
          <p class="text-2xl font-light">Expected Packages</p>

          {#if filteredPackages['expected'].length === 0}
            <p class="font-light text-center dark:text-gray-600 text-gray-400">No expected packages</p>
          {:else}
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

                      {#each filteredPackages['expected'] as p}
                        <TableBodyRow>
                          <TableBodyCell>
                            <a href={"pickupPoint/packages/" + p.id} class="underline">{p.id}</a>
                          </TableBodyCell>
                          <TableBodyCell>{p.states[p.states.length - 1].orderDate.split("T")[0]}</TableBodyCell>
                          <TableBodyCell>{p.states[p.states.length - 1].orderDate.split("T")[1].split(".")[0]}</TableBodyCell>
                          <TableBodyCell>{p.client.fname + " " + p.client.lname}</TableBodyCell>
                          <TableBodyCell>
                            <Badge color={states[p.orderState][0]}>{states[p.orderState][1]}</Badge>
                          </TableBodyCell>
                        </TableBodyRow>
                      {/each}

                    </TableBody>
                  </Table>

                  <div class="flex justify-center items-center mt-3">
                    <div>
                      <a href="/pickupPoint/packages?filter=expected"><Icon src={ BsPlusCircle} color="#fe795d" className="w-6 h-6 mr-3" /></a>
                    </div>
                    <div>
                      <a href="/pickupPoint/packages?filter=expected" class="text-primary-500">See all expected packages</a>
                    </div>
                  </div>
                </div>
          {/if}
      </div>


      <div class="mb-16">
        <p class="text-2xl font-light">Canceled Packages</p>

        {#if filteredPackages['cancelled'].length === 0}
          <p class="font-light text-center dark:text-gray-600 text-gray-400">No cancelled packages</p>
        {:else}

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
                    
                    {#each filteredPackages['cancelled'] as p}
                      <TableBodyRow>
                        <TableBodyCell>
                          <a href={"pickupPoint/packages/" + p.id} class="underline">{p.id}</a>
                        </TableBodyCell>
                        <TableBodyCell>{p.states[p.states.length - 1].orderDate.split("T")[0]}</TableBodyCell>
                        <TableBodyCell>{p.states[p.states.length - 1].orderDate.split("T")[1].split(".")[0]}</TableBodyCell>
                        <TableBodyCell>{p.client.fname + " " + p.client.lname}</TableBodyCell>
                        <TableBodyCell>
                          <Badge color={states[p.orderState][0]}>{states[p.orderState][1]}</Badge>
                        </TableBodyCell>
                      </TableBodyRow>
                    {/each}

                  </TableBody>
                </Table>

                <div class="flex justify-center items-center mt-3">
                  <div>
                    <a href="/pickupPoint/packages?filter=canceled"><Icon src={ BsPlusCircle} color="#fe795d" className="w-6 h-6 mr-3" /></a>
                  </div>
                  <div>
                    <a href="/pickupPoint/packages?filter=canceled" class="text-primary-500">See all canceled packages</a>
                  </div>
                </div>
          </div>
        {/if}
    </div>
  </div>
{/if}


<!-- REGISTER PACKAGE -->

<Modal bind:open={registerPackageModal} size="xs" autoclose={false} class="w-full">
  <form
    class="flex flex-col space-y-6"
    on:submit|preventDefault={() => {registerPackageConsentModal = true}}
  >
    <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Register New Package</h3>

    <Label class="space-y-2">
      <span>Package ID</span>
      <Input 
          type="text"
          name="packageId"
          placeholder="XXXXXX"
          required
          bind:value={packageId}
      />
    </Label>

    <Button type="submit" color="primary" class="w-full1">Register</Button>
  </form>
</Modal>

<Modal bind:open={registerPackageConsentModal} size="xs" autoclose>
  <div class="text-center">
      <svg aria-hidden="true" class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
      <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to register the package {packageId}?</h3>
      <Button on:click={registerPackage} color="green" class="mr-2">Yes, I'm sure</Button>
      <Button color='alternative'>No, cancel</Button>
  </div>
</Modal>




<!-- REGISTER PICK UP -->

<Modal bind:open={registerPickUpModal} size="xs" autoclose={false} class="w-full">
  <form
    class="flex flex-col space-y-6"
    on:submit|preventDefault={() => {registerPickUpConsentModal = true}}
  >
    <h3 class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Register Collected Package</h3>

    <Label class="space-y-2">
      <span>Package ID</span>
      <Input 
          type="text"
          name="packageId"
          placeholder="XXXXXX"
          required
          bind:value={packageId}
      />
    </Label>

    <Button type="submit" color="primary" class="w-full1">Set as collected</Button>
  </form>
</Modal>

<Modal bind:open={registerPickUpConsentModal} size="xs" autoclose>
  <div class="text-center">
      <svg aria-hidden="true" class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
      <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to set package {packageId} as collected?</h3>
      <Button on:click={registerPickUp} color="green" class="mr-2">Yes, I'm sure</Button>
      <Button color='alternative'>No, cancel</Button>
  </div>
</Modal>
