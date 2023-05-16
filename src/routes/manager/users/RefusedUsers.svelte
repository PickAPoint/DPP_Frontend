<script>
    import { Card, Listgroup, Avatar } from "flowbite-svelte";

    export let users_list = [
        { id: 1, name: 'Fnac Aveiro', email: 'fnac@ua.ptAveiro', address: 'Fórum Aveiro, R. do Batalhão de Caçadores 10, 3810-064 Aveiro' },
        { id: 2, name: 'McDonalds Aveiro', email: 'mc@ua.pt', address: 'R. Das Pombas, Aveiro, Aveiro 3810-150'},
        { id: 3, name: 'Burger King Aveiro', email: 'bk@ua.pt', address: 'Burger King - Verdemilho, Ic 1 216, 3810-193'},
        { id: 4, name: 'Pingo Doce Aveiro', email: 'pingodoce@ua.pt', address: 'R. do Batalhão de Caçadores 10, 3810-064 Aveiro'},
    ]


</script>

{#if users_list.length == 0}
    <div class="flex justify-center items-center h-[20vh]">
        <p class="text-gray-500 dark:text-gray-400">No Refused Requests found</p>
    </div>
{:else}

    <Card size="">
    <Listgroup items={users_list} let:item class="border-0 dark:!bg-transparent">
        <div class="grid grid-cols-3 gap-x-[2%] grid-cols-[8%_max(30%)_1fr]">
        <Avatar class="flex-shrink-0 truncate">{item.name[0]}</Avatar>
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
    </Card>
{/if}