<script>
  import Stats from "./Stats.svelte";
  import { onMount } from "svelte";
  import { fly } from 'svelte/transition';
  import { goto } from '$app/navigation';
  import { session } from '$lib/session';
  import { ApiPickupPoint } from '$lib/api/ApiPickupPoint';
  import Loading from "$lib/components/Loading.svelte";
  import { Button, Modal, Input, Label, Alert, Spinner } from 'flowbite-svelte';
  import CancelledPackages from "./CancelledPackages.svelte";
  import StoredPackages from "./StoredPackages.svelte";
  import ExpectedPackages from "./ExpectedPackages.svelte";

  let loading = true;
  let packageId = "";
  let token = "";
  let packages = [];
  let filteredPackages = {};

  let registerPackageModal = false;
  let registerPickUpModal = false;
  let errorRegisterPackage = false;
  let errorRegisterPickUp = false;
  let loadingRegisterPackage = false;
  let loadingRegisterPickUp = false;


  onMount(async () => {
    if ($session.id === undefined || $session.type != "Partner") {
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
    loadingRegisterPackage = true;

    const payload = {
      packageId: packageId,
      newState: 'Delivered'
    }
    
    ApiPickupPoint.updatePackageState(payload)
      .then(res => {
        if (res) {
          registerPackageModal = false;
        }
        else {
          errorRegisterPackage = true;
        }
      })
      .catch(err => {
        console.log(err);
      })
      .finally(() => {
        loadingRegisterPackage = false;
      })
  }


  function registerPickUp() {
    loadingRegisterPickUp = true;

    const payload = {
      packageId: packageId,
      newState: 'Collected',
      token: token
    }
    
    ApiPickupPoint.updatePackageState(payload)
      .then(res => {
        if (res) {
          registerPickUpModal = false;
        }
        else {
          errorRegisterPickUp = true;
        }
      })
      .catch(err => {
        console.log(err);
      })
      .finally(() => {
        loadingRegisterPickUp = false;
      })
  }

</script>


{#if loading}
  <Loading />
{:else}

  <div
    in:fly={{y: 100, duration: 300, opacity:0}}
    class="container my-12">

      <div>
          <p class="text-4xl font-bold inline-block">{$session.name}</p>
          <span class="font-extralight italic mx-1 text-lg">Pick-up Point</span>
          
          <div class="mt-4 mb-11">
              <Button id="register_package" color="primary" on:click={() => registerPackageModal = true}>Register Package</Button>
              <Button id="register_pickup" color="primary" on:click={() => registerPickUpModal = true}>Register Pick Up</Button>
          </div>
      </div>

      <Stats packages={filteredPackages} />

      {#if filteredPackages['expected'].length > 0}
        <div class="mb-16">
          <p class="text-2xl font-light">Expected Packages</p>
          <ExpectedPackages expectedPackages={filteredPackages['expected']} />
        </div>
      {/if}

      {#if filteredPackages['stored'].length > 0}
        <div class="mb-16">
          <p class="text-2xl font-light">Stored Packages</p>
          <StoredPackages storedPackages={filteredPackages['stored']} />
        </div>
      {/if}

      {#if filteredPackages['cancelled'].length > 0}
        <div class="mb-16">
          <p class="text-2xl font-light">Canceled Packages</p>
          <CancelledPackages cancelledPackages={filteredPackages['cancelled']} />
        </div>
      {/if}
  </div>
{/if}


<Modal bind:open={registerPackageModal} size="xs" autoclose={false} class="w-full">
  <form
    class="flex flex-col space-y-6"
    on:submit|preventDefault={registerPackage}
  >
    <h3 id="register_modal_title" class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Register New Package</h3>

    <Label class="space-y-2">
      <span>Package ID</span>
      <Input
          id="register_modal_package_id"
          type="number"
          min="1"
          name="packageId"
          placeholder="Enter Package ID"
          required
          bind:value={packageId}
      />
    </Label>

    {#if errorRegisterPackage}
      <Alert color="red">
          <span id="register_error_msg" class="font-medium">Error!</span> Invalid Package ID.
      </Alert>
    {/if}

    <Button id="register_btn_form" type="submit" color="primary" class="w-full1">
      {#if loadingRegisterPackage}
        <Spinner class="mr-3" size="4" color="white" />
      {/if}
      Register
    </Button>
  </form>
</Modal>


<Modal bind:open={registerPickUpModal} size="xs" autoclose={false} class="w-full">
  <form
    class="flex flex-col space-y-6"
    on:submit|preventDefault={registerPickUp}
  >
    <h3 id="collect_modal_title" class="mb-4 text-xl font-medium text-gray-900 dark:text-white">Register Collected Package</h3>

    <Label class="space-y-2">
      <span>Package ID</span>
      <Input
          id="collect_modal_package_id"
          type="number"
          min="1"
          name="packageId"
          placeholder="Enter Package ID"
          required
          bind:value={packageId}
      />
    </Label>

    <Label class="space-y-2">
      <span>Token</span>
      <Input
          id="collect_modal_package_token"
          type="text"
          name="packageId"
          placeholder="Enter token received via SMS"
          required
          bind:value={token}
      />
    </Label>

    {#if errorRegisterPickUp}
      <Alert color="red">
          <span id="collect_error_msg" class="font-medium">Error!</span> Invalid Package ID or Token.
      </Alert>
    {/if}

    <Button id="collect_btn_form" type="submit" color="primary" class="w-full1">Set as collected</Button>
  </form>
</Modal>
