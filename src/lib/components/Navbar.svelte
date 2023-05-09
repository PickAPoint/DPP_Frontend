<script>
  import { 
    Navbar, 
    NavBrand, 
    NavLi, 
    NavUl, 
    NavHamburger, 
    Avatar, 
    Dropdown, 
    DropdownItem, 
    DropdownHeader, 
    DropdownDivider, 
    DarkMode,
    Button
  } from 'flowbite-svelte'
  import { page } from '$app/stores';
  import FaShoppingCart from 'svelte-icons/fa/FaShoppingCart.svelte';
  import FaShoppingBag from 'svelte-icons/fa/FaShoppingBag.svelte';
  import FaSignOutAlt from 'svelte-icons/fa/FaSignOutAlt.svelte';
  import { goto } from '$app/navigation';
  import { session } from '$lib/session';

  function handleLogout() {
    session.set({
      userId: undefined,
      userFname: undefined,
      userLname: undefined,
      userEmail: undefined,
      token: undefined,
    })
    localStorage.removeItem('session');
    goto('/');
  }

</script>
  
<Navbar 
  let:hidden 
  let:toggle 
  fluid={true} 
  color="default"
  navClass="border-b border-gray-200 dark:border-gray-700 px-2 sm:px-4 py-2.5 w-full sticky top-0 z-50"
>
  <NavBrand href="/" class="w-52">
    <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">PrintPlate</span>
  </NavBrand>
  <div class="flex items-center md:order-2 w-52 justify-end">
    <DarkMode class="mr-3" />
    {#if $session.userId !== undefined}
      <Avatar id="avatar-menu" class="cursor-pointer" > {$session.userFname[0]}{$session.userLname[0]} </Avatar>
    {:else}
      <Button href="login">Login</Button>
    {/if}
    <NavHamburger on:click={toggle} class1="w-full md:flex md:w-auto md:order-1"/>
  </div>
  {#if $session.userId !== undefined}
    <Dropdown placement="bottom" triggeredBy="#avatar-menu" class="w-fit-content">
      <DropdownHeader>
        <span class="block text-sm"> {$session.userFname} {$session.userLname} </span>
        <span class="block text-sm font-medium"> {$session.userEmail} </span>
      </DropdownHeader>
      <DropdownItem class="flex items-center" href="/myShoppingCart">
        <div class="h-4 w-4 mr-2">
          <FaShoppingCart/>
        </div>
        <span>Shopping cart</span>
      </DropdownItem>
      <DropdownItem class="flex items-center" href="/myOrders">
        <div class="h-4 w-4 mr-2">
          <FaShoppingBag />
        </div>
        <span>Oders</span>
      </DropdownItem>
      <DropdownDivider />
      <DropdownItem class="flex items-center" on:click={handleLogout}>
        <div class="h-4 w-4 mr-2">
          <FaSignOutAlt/>
        </div>
        <span>Logout</span>
      </DropdownItem>
      <DropdownDivider />
    </Dropdown>
  {/if}
  <NavUl {hidden}>
    <NavLi href="/" active={$page.url.pathname === '/'}>Home</NavLi>
    <NavLi href="/products" active={$page.url.pathname === '/products'}>Products</NavLi>
    <NavLi href="/about" active={$page.url.pathname === '/about'}>About</NavLi>
  </NavUl>
</Navbar>