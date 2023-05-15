<script>
    import { Popover, Card, Label, Input, Checkbox, MenuButton, Dropdown, DropdownItem, Avatar, Button } from "flowbite-svelte";
    import { blur, fade, slide } from 'svelte/transition';

    let users = [
    { id: 1, name: 'Fnac Aveiro', email: 'fnac@ua.ptAveiro', address: 'Fórum Aveiro, R. do Batalhão de Caçadores 10, 3810-064 Aveiro' },
    { id: 2, name: 'McDonalds Aveiro', email: 'mc@ua.pt', address: 'R. Das Pombas, Aveiro, Aveiro 3810-150'},
    { id: 3, name: 'Burger King Aveiro', email: 'bk@ua.pt', address: 'Burger King - Verdemilho, Ic 1 216, 3810-193'},
    { id: 4, name: 'Pingo Doce Aveiro', email: 'pingodoce@ua.pt', address: 'R. do Batalhão de Caçadores 10, 3810-064 Aveiro'},
  ];
  
</script>

<div class="grid grid-cols-3 gap-y-[7%] gap-x-[5%]">
  {#if users.length === 0}
    <div class="col-span-3">
      <div class="flex flex-col items-center justify-center h-full space-y-2">
        <h3 class="text-2xl font-medium text-gray-900 dark:text-white">No Requests found</h3>
        <p class="text-gray-500 dark:text-gray-400">We couldn't find any Join Us Requests. Check again Later.</p>
      </div>
    </div>
  {:else}
    {#each users as user}
      <Card id="b{user.id}" padding='sm'>
          <!-- <div class="flex justify-end">
            <MenuButton />
            <Dropdown class="w-36">
              <DropdownItem>Edit</DropdownItem>
              <DropdownItem>Remove Request and Forget</DropdownItem>
            </Dropdown>
          </div> -->
          <div class="flex flex-col items-center pb-4">
              <Avatar size="lg">{user.name.charAt(0)}</Avatar>
              <h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white truncate w-[100%] text-center">{user.name}</h5>
              <span class="text-sm text-gray-500 dark:text-gray-400">PickUp Point</span>
              <div class="flex mt-4 space-x-3 lg:mt-6">
                <Button color="primary" >Accept</Button>
                <Button color="light" class="dark:text-white">Refuse</Button>
              </div>
          </div>
        </Card>

        <Popover transition={fade} params={{duration: 300}} triggeredBy="#b{user.id}" class="w-64 text-sm font-light text-gray-500 bg-white dark:text-gray-400 dark:border-gray-600 dark:bg-gray-800">
          <div class="p-3">
            <div class="flex flex-col space-y-6">
              <Label class="space-y-2">
                <span class="font-bold">Name</span>
                <!-- <Input type="email" name="email" placeholder="name@company.com" required /> -->
                <p class="pl-2 text-sm text-gray-500 truncate dark:text-gray-400">
                  {user.name}
                </p>
              </Label>
              <Label class="space-y-2">
                <span class="font-bold">Email</span>
                <p class="pl-2 text-sm text-gray-500 truncate dark:text-gray-400">
                  {user.email}
                </p>
              </Label>
              <Label class="space-y-2">
                <span class="font-bold">Address</span>
                <!-- <Input type="email" name="email" placeholder="name@company.com" required /> -->
                <p class="pl-2 text-sm text-gray-500 truncate dark:text-gray-400">
                  {user.address}
                </p>
              </Label>
            </div>
          </div>
        </Popover>
    {/each}
  {/if}

</div>

