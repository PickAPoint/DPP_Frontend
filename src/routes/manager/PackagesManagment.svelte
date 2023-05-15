<script>
    import { Card, Listgroup, Avatar, Table, TableHead, TableHeadCell, TableBody, TableBodyCell, TableBodyRow } from "flowbite-svelte";

    export let packages= [];

    function getMultipleRandom(arr, num) {
        const shuffled = [...arr].sort(() => 0.5 - Math.random());

        return shuffled.slice(0, num);
    }


</script>

<div class="mb-16">
    <a href="/manager/packages" class="text-sm font-medium text-primary-900 hover:underline">
    <p class="text-2xl font-light">Pick Up Points Packages</p>
    </a>

    <div class="my-3 w-full">
      {#if packages.length === 0}
          <div class="flex justify-center items-center">
              <p class="text-gray-500 dark:text-gray-400">No PickUp Point Packages found. The either the database is down or there are still no packages </p>
          </div>
      {:else}
      <Table shadow>
        <TableHead>
          <TableHeadCell>Package ID</TableHeadCell>
          <TableHeadCell>Arrival Date</TableHeadCell>
          <TableHeadCell>Arrival Time</TableHeadCell>
          <TableHeadCell>Courier</TableHeadCell>
          <TableHeadCell>Time Stored</TableHeadCell>
        </TableHead>
          <TableBody class="divide-y">
            {#each getMultipleRandom(packages, 5) as pack}
              <TableBodyRow>
                <TableBodyCell>
                  <div class="w-[10vh] truncate">
                    {pack.id}
                  </div>
                </TableBodyCell>
                <TableBodyCell>
                  <div class="w-[15vh] truncate">
                    {pack.arrival_date}
                  </div>
                </TableBodyCell>
                <TableBodyCell>
                  <div class="w-[15vh] truncate">
                    {pack.arrival_time}
                  </div>
                </TableBodyCell>
                <TableBodyCell>
                  <div class="w-[30vh] truncate">
                    {pack.courier}
                  </div>
                  </TableBodyCell>
                <TableBodyCell>
                  <div class="w-[10vh] truncate">
                    {pack.time_stored} days
                  </div>
                  </TableBodyCell>
              </TableBodyRow>
            {/each}
            </TableBody>
        </Table>
      {/if}
    </div>
</div>