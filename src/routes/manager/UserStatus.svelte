<script>
    import { Card, MenuButton, Dropdown, DropdownItem, Avatar, Button } from "flowbite-svelte";



    

</script>

<Card padding='sm'>
    <div class="flex justify-end">
      <!-- <MenuButton />
      <Dropdown class="w-36">
        <DropdownItem>Edit</DropdownItem>
        <DropdownItem>Remove Request and Forget</DropdownItem>
      </Dropdown> -->
    </div>
    <div class="flex flex-col items-center pb-4">
        <Avatar size="lg">F</Avatar>
        <h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">FNAC Aveiro</h5>
        <span class="text-sm text-gray-500 dark:text-gray-400">PickUp Point</span>
        <div class="flex mt-4 space-x-3 lg:mt-6">
          <Button color="primary" >Accept</Button>
          <Button color="light" class="dark:text-white">Refuse</Button>
        </div>
    </div>
  </Card>

