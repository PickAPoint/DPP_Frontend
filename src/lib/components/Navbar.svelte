<script>
  import { Navbar, NavBrand, NavLi, NavUl, NavHamburger, DarkMode, Button } from 'flowbite-svelte'
  import { page } from '$app/stores';
  import { goto } from '$app/navigation';
  import { session } from '$lib/session';

  function handleLogout() {
    session.set({
      id: undefined,
      name: undefined,
      email: undefined,
      address: undefined,
      token: undefined
    })
    localStorage.removeItem('session');
    goto('/');
  }

</script>
  
<Navbar 
  let:hidden 
  let:toggle 
  fluid={true}
  navClass="border-b border-gray-200 dark:border-gray-700 px-2 sm:px-4 py-2.5 w-full sticky top-0 z-50 drop-shadow-lg"
>
  <NavBrand href="/" class="w-52">
    <span class="self-center whitespace-nowrap text-4xl font-semibold dark:text-white brand text-gray-700">PickAPoint</span>
  </NavBrand>

  <div class="flex items-center md:order-2 w-52 justify-end">
    <DarkMode class="mr-3" />

    {#if $session.id}
      <Button color="primary" on:click={handleLogout}>Logout</Button>
    {:else}
      <Button color="primary" href="login">Login</Button>
    {/if}

    <NavHamburger on:click={toggle} class1="w-full md:flex md:w-auto md:order-1"/>
  </div>

  <NavUl {hidden}>

    {#if $session.id}
      
      {#if $session.type === 'Admin'}
        <NavLi href="/manager">TODO</NavLi>
      {:else if $session.type === 'Partner'}
        <NavLi class="hover:text-primary-700 md:hover:text-primary-700 lg:hover:text-primary-700" href="/pickupPoint">Dashboard</NavLi>
        <NavLi class="hover:text-primary-700 md:hover:text-primary-700 lg:hover:text-primary-700" href="/pickupPoint/packages">Packages</NavLi>
      {/if}

    {/if}

  </NavUl>

</Navbar>