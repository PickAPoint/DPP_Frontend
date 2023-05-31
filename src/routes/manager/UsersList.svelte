<script>
    import { Card, Listgroup, Avatar } from "flowbite-svelte";

    export let users_list = [];

    function getMultipleRandom(arr, num) {
        const shuffled = [...arr].sort(() => 0.5 - Math.random());

        return shuffled.slice(0, num);
    }


</script>

<Card padding="xl" size="">
    <div class="flex justify-between items-center mb-4">
        <h5 class="text-xl font-bold leading-none text-gray-900 dark:text-white">Pick Up Points</h5>
        <a id="view_all" href="/manager/users" class="text-sm font-medium text-primary-900 hover:underline">
            View all
        </a>
    </div>

    {#if users_list.length === 0}
        <div class="flex justify-center items-center">
            <p class="text-gray-500 dark:text-gray-400">No PickUp Point found. Click View all to check for Join Us Requests </p>
        </div>

    {:else}
        <Listgroup items={getMultipleRandom(users_list, 5)} let:item class="border-0 dark:!bg-transparent">
            <div class="grid grid-cols-3 gap-x-[2%] grid-cols-[8%_max(30%)_1fr]">
            <Avatar class="flex-shrink-0 truncate">{item.name.charAt(0)}</Avatar>
            <div class="flex-1 min-w-0">
                <p class="text-sm font-medium text-gray-900 truncate dark:text-white">
                {item.name}
                </p>
                <p class="text-sm text-gray-500 truncate dark:text-gray-400">
                {item.email}
                </p>
            </div>
            <div class="text-base font-semibold text-gray-900 truncate dark:text-white">
                {item.address}
            </div>
            
            </div>
        </Listgroup>

    {/if}
</Card>