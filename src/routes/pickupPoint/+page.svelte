<script>
    import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Button, Modal, Input, Label } from 'flowbite-svelte';
	  import Stats from "./Stats.svelte";

    let companyName = "Fnac Aveiro";
    let packageId = "";
    let registerPackageModal = false;
    let registerPackageConsentModal = false;
    let registerPickUpModal = false;
    let registerPickUpConsentModal = false;

    let packages = [
        {
            "group": "Stored",
            "value": 120
        },
        {
            "group": "Expected",
            "value": 34
        },
        {
            "group": "Forgotten",
            "value": 10
        },
        {
            "group": "Canceled",
            "value": 5
        }
    ];

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


<div class="container my-12">

    <div>
        <p class="text-4xl font-bold inline-block">{companyName}</p>
        <span class="font-extralight italic mx-1 text-lg">Pick-up Point</span>
        
         <div class="mt-4 mb-11">
             <Button color="primary" on:click={() => registerPackageModal = true}>Register Package</Button>
             <Button color="primary" on:click={() => registerPickUpModal = true}>Register Pick Up</Button>
        </div>
    </div>

    <Stats data={packages} />


    <div class="mb-16">
        <p class="text-2xl font-light">Stored Packages</p>

        <div class="my-3">
            <Table shadow>
                <TableHead class="bg-primary-200">
                  <TableHeadCell>Package ID</TableHeadCell>
                  <TableHeadCell>Arrival Date</TableHeadCell>
                  <TableHeadCell>Arrival Time</TableHeadCell>
                  <TableHeadCell>Courier</TableHeadCell>
                  <TableHeadCell>Time Stored</TableHeadCell>
                </TableHead>
                <TableBody class="divide-y">
                  <TableBodyRow>
                    <TableBodyCell>AC123TD5</TableBodyCell>
                    <TableBodyCell>10/05/2023</TableBodyCell>
                    <TableBodyCell>14:45:00</TableBodyCell>
                    <TableBodyCell>John Paul</TableBodyCell>
                    <TableBodyCell>2 days</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>1BAH53GD</TableBodyCell>
                    <TableBodyCell>10/05/2023</TableBodyCell>
                    <TableBodyCell>09:34:10</TableBodyCell>
                    <TableBodyCell>Miller Pascal</TableBodyCell>
                    <TableBodyCell>3 days</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>07AHDND6</TableBodyCell>
                    <TableBodyCell>23/05/2023</TableBodyCell>
                    <TableBodyCell>12:54:10</TableBodyCell>
                    <TableBodyCell>Mary Lawrance</TableBodyCell>
                    <TableBodyCell>5 hours</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>AC156TD5</TableBodyCell>
                    <TableBodyCell>11/05/2023</TableBodyCell>
                    <TableBodyCell>13:25:00</TableBodyCell>
                    <TableBodyCell>John Paul</TableBodyCell>
                    <TableBodyCell>2 days</TableBodyCell>
                  </TableBodyRow>
                </TableBody>
              </Table>

              <div class="text-center mt-2">
                <a href="/pickupPoint/packages" class="text-primary-500">See all stored packages</a>
              </div>
        </div>
    </div>

    <div class="mb-16">
        <p class="text-2xl font-light">Expected Packages</p>

        <div class="my-3">
            <Table shadow>
                <TableHead class="bg-primary-200">
                  <TableHeadCell>Package ID</TableHeadCell>
                  <TableHeadCell>Arrival Date</TableHeadCell>
                  <TableHeadCell>Arrival Time</TableHeadCell>
                  <TableHeadCell>Courier</TableHeadCell>
                  <TableHeadCell>Time Stored</TableHeadCell>
                </TableHead>
                <TableBody class="divide-y">
                  <TableBodyRow>
                    <TableBodyCell>AC123TD5</TableBodyCell>
                    <TableBodyCell>10/05/2023</TableBodyCell>
                    <TableBodyCell>14:45:00</TableBodyCell>
                    <TableBodyCell>John Paul</TableBodyCell>
                    <TableBodyCell>2 days</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>1BAH53GD</TableBodyCell>
                    <TableBodyCell>10/05/2023</TableBodyCell>
                    <TableBodyCell>09:34:10</TableBodyCell>
                    <TableBodyCell>Miller Pascal</TableBodyCell>
                    <TableBodyCell>3 days</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>07AHDND6</TableBodyCell>
                    <TableBodyCell>23/05/2023</TableBodyCell>
                    <TableBodyCell>12:54:10</TableBodyCell>
                    <TableBodyCell>Mary Lawrance</TableBodyCell>
                    <TableBodyCell>5 hours</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>AC156TD5</TableBodyCell>
                    <TableBodyCell>11/05/2023</TableBodyCell>
                    <TableBodyCell>13:25:00</TableBodyCell>
                    <TableBodyCell>John Paul</TableBodyCell>
                    <TableBodyCell>2 days</TableBodyCell>
                  </TableBodyRow>
                </TableBody>
              </Table>
        </div>
    </div>

    <div class="mb-16">
        <p class="text-2xl font-light">Forgotten Packages</p>

        <div class="my-3">
            <Table shadow>
                <TableHead class="bg-primary-200">
                  <TableHeadCell>Package ID</TableHeadCell>
                  <TableHeadCell>Arrival Date</TableHeadCell>
                  <TableHeadCell>Arrival Time</TableHeadCell>
                  <TableHeadCell>Courier</TableHeadCell>
                  <TableHeadCell>Time Stored</TableHeadCell>
                </TableHead>
                <TableBody class="divide-y">
                  <TableBodyRow>
                    <TableBodyCell>AC123TD5</TableBodyCell>
                    <TableBodyCell>10/05/2023</TableBodyCell>
                    <TableBodyCell>14:45:00</TableBodyCell>
                    <TableBodyCell>John Paul</TableBodyCell>
                    <TableBodyCell>2 days</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>1BAH53GD</TableBodyCell>
                    <TableBodyCell>10/05/2023</TableBodyCell>
                    <TableBodyCell>09:34:10</TableBodyCell>
                    <TableBodyCell>Miller Pascal</TableBodyCell>
                    <TableBodyCell>3 days</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>07AHDND6</TableBodyCell>
                    <TableBodyCell>23/05/2023</TableBodyCell>
                    <TableBodyCell>12:54:10</TableBodyCell>
                    <TableBodyCell>Mary Lawrance</TableBodyCell>
                    <TableBodyCell>5 hours</TableBodyCell>
                  </TableBodyRow>
                  <TableBodyRow>
                    <TableBodyCell>AC156TD5</TableBodyCell>
                    <TableBodyCell>11/05/2023</TableBodyCell>
                    <TableBodyCell>13:25:00</TableBodyCell>
                    <TableBodyCell>John Paul</TableBodyCell>
                    <TableBodyCell>2 days</TableBodyCell>
                  </TableBodyRow>
                </TableBody>
              </Table>
        </div>
    </div>

    <div class="mb-16">
      <p class="text-2xl font-light">Canceled Packages</p>

      <div class="my-3">
          <Table shadow>
              <TableHead class="bg-primary-200">
                <TableHeadCell>Package ID</TableHeadCell>
                <TableHeadCell>Arrival Date</TableHeadCell>
                <TableHeadCell>Arrival Time</TableHeadCell>
                <TableHeadCell>Courier</TableHeadCell>
                <TableHeadCell>Time Stored</TableHeadCell>
              </TableHead>
              <TableBody class="divide-y">
                <TableBodyRow>
                  <TableBodyCell>AC123TD5</TableBodyCell>
                  <TableBodyCell>10/05/2023</TableBodyCell>
                  <TableBodyCell>14:45:00</TableBodyCell>
                  <TableBodyCell>John Paul</TableBodyCell>
                  <TableBodyCell>2 days</TableBodyCell>
                </TableBodyRow>
                <TableBodyRow>
                  <TableBodyCell>1BAH53GD</TableBodyCell>
                  <TableBodyCell>10/05/2023</TableBodyCell>
                  <TableBodyCell>09:34:10</TableBodyCell>
                  <TableBodyCell>Miller Pascal</TableBodyCell>
                  <TableBodyCell>3 days</TableBodyCell>
                </TableBodyRow>
              </TableBody>
            </Table>
      </div>
  </div>
</div>


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
